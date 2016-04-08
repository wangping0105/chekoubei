class Stores::CarsController < ApplicationController
  before_action :set_store

  def index
    @cars = @store.cars.includes(:brand, :attachments)
    @cars = filter_page @cars
  end

  private
  def set_store
    @store = Store.find params[:store_id]
  end
end