class Api::V1::BaseController < ApplicationController #ActionController::Base
  include Api::IkDeviceDetectable
  include Api::IkParamsProcessable
  include Api::IkAuthenticateable
  include Api::IkRescueable

  helper_method :current_user
  before_action :authenticate!

  respond_to :json

  protected

  def set_default_page_params
    params[:page] ||= 1
    params[:per_page] ||= Kaminari.config.default_per_page
  end
end
