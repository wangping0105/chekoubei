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
    @brands = Brand.all.map{|b| [b.name, b.id]}
    @store_categories = StoreCategory.all.map{|b| [b.name, b.id]}
  end
  
  def create
    _files = params[:file] || []
    
    business_hours_start = params[:business_hours_start].to_s
    business_hours_end = params[:business_hours_end]
    
    @store = Store.new(store_params.merge( {business_hours: [business_hours_start, business_hours_end]} ))
    Store.transaction do
      if @store.save
        _files.each do |file|
          Attachment.create(file: file, user: current_user, attachmentable: @store)
        end
        # StoreCategoryRelation.create(store_id: @store.id, store_category_id: params[:store_category_id])一个门店对应一个类型
        flash[:success] = "门店创建成功！"
        redirect_to stores_path
      else
        flash[:success] = "门店创建失败！#{@store.errors.full_messages}"
        redirect_to new_store_path
      end
    end
  
  end

  def get_address_options
    if params[:types] == 'city'
      @data = City.where(province_id: params[:parent_id])
    else
      @data = District.where(city_id: params[:parent_id])
    end

    render json: {data: @data}
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