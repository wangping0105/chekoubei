class Api::V1::Users::StoresController < Api::V1::BaseController
  before_action :set_default_page_params, only: [ :index]

  def index
    param! :lat, String, required: false
    param! :lng, String, required: false

    if params[:order] == "distance"
      @stores = Address.includes(addressable: [:image_attachments, :address]).joins("left join stores s on s.id = addresses.addressable_id").
        near([params[:lat].to_f, params[:lng].to_f], 65536, :order => "distance").
        where(addressable_type: 'Store').page(params[:page]).per(params[:per_page])

      data = @stores.map{|s|
        s.addressable.distance = s.distance
        StoreSerializer.new(s.addressable)
      }
    else
      @stores = Store.includes(:image_attachments, :address).page(params[:page]).per(params[:per_page])
      @stores = filter_stores(@stores)
      data = ActiveModel::ArraySerializer.new(@stores, each_serializer: StoreSerializer)
    end

    render json: {
      code: 0,
      data: data,
      total_count: @stores.total_count,
      per_page: (params[:per_page]).to_i,
      page: (params[:page]).to_i
    }
  end

  private
  def filter_stores(stores)

    stores
  end
end
