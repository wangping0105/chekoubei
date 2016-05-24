class HomeController < ApplicationController
  before_action :is_super_admin?
  def index
    @users =  User.includes(:store).order(updated_at: :desc)
    @users = filter_page(@users)
  end
end