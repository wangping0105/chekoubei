class CarsController < ApplicationController
  before_action :is_super_admin?
  def index
    @cars = Car.includes(:brand, :attachments)
    @cars = filter_page @cars
  end
end