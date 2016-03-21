class StoresController < ApplicationController

  def index
    @stores = Store.includes(:attachments, :brand, :store_category, address: [:district])
    @stores = filter_page @stores
  end

  def show
  end
end