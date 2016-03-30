class StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def index
    @stores = Store.includes(:attachments, :brand, :store_category, address: [:district])
    @stores = filter_page @stores
  end

  def show
  end

  def new
    @store = Store.new
    @brands = Brand.all.map{|b| [b.id, b.name]}
    @store_categories = StoreCategory.all.map{|b| [b.id, b.name]}
  end
  private
  def set_store
    @store = Store.find params[:id]
  end

  def store_params

    [
      :name, :level, :introduction, :brand_id,
      attachments_attributes: [:file, :_destroy, :id],
      store_category_relation: [:store_category_id]
    ]

  end
end