class Stores::CarsController < ApplicationController
  before_action :set_store

  def index
    @cars = @store.cars.includes(:brand, :attachments)
    @cars = filter_page @cars
  end

  def new
    @car = @store.cars.new
    @brands = Brand.all.map{|b| [b.name, b.id]}
  end

  def create
    _files = params[:file] || []

    @car = @store.cars.new(car_params.merge(brand_id: @store.brand_id, user: current_user))
    Car.transaction do
      if @car.save
        _files.each do |file|
          Attachment.create(file: file, user: current_user, attachmentable: @car, sub_type: nil)
        end
        @car.store_car.update(title: params[:title])

        flash[:success] = "创建成功！"
        redirect_to store_stores_cars_path
      else
        flash[:success] = "创建失败！#{@store.errors.full_messages}"
        redirect_to new_store_stores_car_path
      end
    end
  end

  private
  def set_store
    @store = Store.find params[:store_id]
  end

  def car_params
    params.require(:car).permit([:model_no, :color, :distance, :on_time])
  end
end