class Api::V1::Users::StoresController < Api::V1::BaseController
  before_actin :set_default_page_params, only: [ :index]
  def index
    @stores = Store
  end
end