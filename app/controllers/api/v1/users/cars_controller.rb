class Api::V1::Users::CarsController < Api::V1::BaseController
  before_action :set_default_page_params, only: [ :index]

  def index
    @cars = Car.includes(:user, :attachments, :store)
    @cars = filter_page(@cars)

    render json:{code: 0, data: ActiveModel::ArraySerializer.new(@cars, each_serializer: CarSerializer)}
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      render json:{
          code: 0,
          data: CarSerializer.new(@car)
      }
    else
      raise EntityValidationError.new(@car)
    end
  end

  def brands
    @brands = Brand.car_brand.order(pinyin: :asc)

    render json:{code: 0, data: @brands.map{|b| { id: b.id, name: b.name, stores_count: (b.stores_count||0), pinyin: b.pinyin.upcase[0] }}}
  end
  private
  def car_params
    params_encoded(params.require(:car).permit(:brand_id, :model_no, :color, :distance, :on_time, :description, :car_type))
  end
end
