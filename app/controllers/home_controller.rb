class HomeController < ApplicationController
  before_action :is_super_admin?
  def index
    @brands = Brand.order(pinyin: :asc)
    @brands = filter_page @brands
  end
end