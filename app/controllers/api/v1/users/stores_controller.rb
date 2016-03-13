class Api::V1::Users::StoresController < Api::V1::BaseController
  before_action :set_default_page_params, only: [ :index]

  def index
    param! :lat, String, required: false
    param! :lng, String, required: false

    @stores = Store.includes(:image_attachments, :address).page(params[:page]).per(params[:per_page])
    @stores = filter_stores(@stores)

    render json: {
      code: 0,
      data: ActiveModel::ArraySerializer.new(@stores, each_serializer: StoreSerializer)
    }
  end

  private
  def filter_stores(stores)
    if params[:order] == "distance"
      stores = stores.near([params[:lat].to_f, params[:lng].to_f], 65535, :order => "distance")
    end

    stores
  end
end
