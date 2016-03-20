class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :default_page_title,  :store_location
  before_action :authenticate_user!
  include ApplicationHelper

  before_action do
    if Rails.env == "development"
      Rack::MiniProfiler.authorize_request
    end
  end

  private
  def default_page_title
    @page_title = "魔书网"
  end

  def raise_error(flag, message)
    if flag
      raise StandardError.new(message)
    end
  end

  def simple_error_message(entity)
    entity.errors.messages.map{|k,v| v.join(":")}.join(",")
  end

  def filter_page(relation)
    relation = relation.page(params[:page]).per(params[:per_page])
    relation
  end
end
