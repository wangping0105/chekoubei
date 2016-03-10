class Api::V1::Users::StoresController < Api::V1::BaseController
  before_action :set_default_page_params, only: [ :index]

  def index
    @stores = Store.includes(:image_attachments, :address).page(params[:page]).per(params[:per_page])

    render json: {
      code: 0,
      data: ActiveModel::ArraySerializer.new(@stores, each_serializer: StoreSerializer)
    }
  end
end
