class Api::V1::Users::StoresController < Api::V1::BaseController

  def index
    @stores = Store
  end
end