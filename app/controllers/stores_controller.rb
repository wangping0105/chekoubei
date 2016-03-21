class StoresController < ApplicationController

  def index
    @stores = Store.includes(:attachments)
    @stores = filter_page @stores
  end

  def show
  end
end