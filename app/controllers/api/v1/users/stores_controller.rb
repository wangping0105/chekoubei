class Api::V1::Users::StoresController < Api::V1::BaseController
  before_action :set_default_page_params, only: [:index, :store_car_list, :store_brands]
  before_action :set_store, only: [:store_car, :store_cars, :show, :store_car_list]

  def index
    param! :lat, String, required: false
    param! :lng, String, required: false
    param! :store_category_id, Integer, required: false

    unless params[:store_category_id]
      params[:store_category_id] = StoreCategory.find_by(name: '新车').try(:id)
    end

    if params[:order] == "distance"
      @stores = Address.includes(addressable: [:image_attachments, :address]).joins("left join stores on stores.id = addresses.addressable_id").
        near([params[:lat].to_f, params[:lng].to_f], 65536, :order => "distance").
        where(addressable_type: 'Store').page(params[:page]).per(params[:per_page])

      @stores = filter_stores(@stores)

      data = @stores.map{|s|
        s.addressable.distance = s.distance
        SimpleStoreSerializer.new(s.addressable)
      }
    else
      @stores = Store.includes(:image_attachments, :address).page(params[:page]).per(params[:per_page])

      @stores = filter_stores(@stores)
      data = ActiveModel::ArraySerializer.new(@stores, each_serializer: SimpleStoreSerializer)
    end

    render json: {
      code: 0,
      data: data,
      total_count: @stores.total_count,
      per_page: (params[:per_page]).to_i,
      page: (params[:page]).to_i
    }
  end

  def store_brands
    param! :brand_type, String, required: false
    params[:brand_type] ||= 'car'
    brand_type = Brand.brand_types[params[:brand_type]]

    @brands = Brand.where(brand_type: brand_type).order(pinyin: :asc).
      where("stores_count > 0").page(params[:page]).per(params[:per_page])
    # data = @brands.map{|s|{id: s.id, name: s.name}}
    @banner = Store.where(brand_id: @brands.pluck(:id)).order(order_count: :desc).first

    render json: {
      code: 0,
      banner: SimpleStoreSerializer.new(@banner),
      data: ActiveModel::ArraySerializer.new(@brands, each_serializer: BrandSerializer),
      total_count: @brands.total_count,
      per_page: (params[:per_page]).to_i,
      page: (params[:page]).to_i
    }
  end

  def store_car_list
    @store_cars = @store.store_cars
    @store_cars = filter_page(@store_cars)

    render json:{code: 0, data: ActiveModel::ArraySerializer.new(@store_cars, each_serializer: StoreCarSerializer)}
  end

  # post
  # 创建
  def store_cars
    param! :car_id, Integer, required: true
    param! :title, String, required: true
    param! :prices, Float, required: true

    car = Car.find params[:car_id]
    @store_car = @store.store_cars.find_or_initialize_by(car_id: car.id)

    @store_car.assign_attributes(title: params[:title], prices: params[:prices])
    if @store_car.save
      render json:{code: 0, data:  StoreCarSerializer.new(@store_car)}
    else
      raise EntityValidationError.new(@store_car)
    end
  end

  # get show
  def store_car
    @store_car = @store.store_cars.find(params[:store_car_id])

    render json:{code: 0, data: StoreCarSerializer.new(@store_car)}
  end
  private
  def filter_stores(stores)
    stores = stores.where("stores.store_category_id = ?", params[:store_category_id]) if params[:store_category_id].present?
    stores = stores.where("stores.brand_id = ?", params[:brand_id]) if params[:brand_id].present?
    stores
  end

  def set_store
    @store = Store.find params[:id]
  end
end
