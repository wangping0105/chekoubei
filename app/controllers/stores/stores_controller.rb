class StoresController < ApplicationController
  before_action :set_store, only: [:show]

  def show
  end

  private
  def set_store
    @store = Store.find params[:id]
  end

  def store_params
    params.require(:store).permit([
      :name, :level, :introduction, :brand_id, :store_category_id,
      attachments_attributes: [:file, :_destroy, :id],
      address_attributes: [:tel, :zip, :fax, :url, :detail_address, :phone, :province_id, :city_id, :country_id, :district_id, :email, :qq, :wechat, :wangwang, :id]
    ])
  end
end