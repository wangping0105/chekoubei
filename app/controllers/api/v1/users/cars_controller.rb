class Api::V1::Users::CarsController < Api::V1::BaseController
  before_action :set_default_page_params, only: [ :index]

  def index
    param! :car_type, String, required: false, in: ['old_car', 'new_car']
    @cars = Car.includes(:user, :attachments, :store)
    @cars = filter_sort(@cars)
    @cars = filter_page(@cars)

    render json:{code: 0, data: ActiveModel::ArraySerializer.new(@cars, each_serializer: CarSerializer)}
  end

  def create
    @car = current_user.cars.new(car_params)
    if @car.save
      create_attachments_by(@car, {attachment_ids: nil})
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

  def filter_sort(relation)
    relation = relation.where(car_type: Car.car_types[params[:car_type]]) if params[:car_type].present?
    relation = relation.where("model_no like ?", "%#{params[:query]}%") if params[:query].present?
    relation = relation.order(id: :desc)

    relation
  end
end
