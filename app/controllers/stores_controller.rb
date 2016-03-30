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
    _file = params[:store][:file]
    
    business_hours_start = params[:business_hours_start].to_s
    business_hours_end = params[:business_hours_end]
    
    @store = Store.new(store_params.merge(business_hours: [business_hours_start, business_hours_end]))
    Store.transaction do
      if @store.save
        Attachment.create(file: _file, user: current_user, attachmentable: @store)
        StoreCategoryRelation.create(store_id: @store.id, store_category_id: params[:store_category_id])
        
        flash[:success] = "门店创建成功！"
        redirect_to stores_path
      else
        flash[:success] = "门店创建失败！"
        render 'new'
      end
    end
  
  end

  private
  def set_store
    @store = Store.find params[:id]
  end

  def store_params
    params.require(:store).permit([
      :name, :level, :introduction, :brand_id,
      attachments_attributes: [:file, :_destroy, :id]
    ])
  end
end