class HomeController < ApplicationController
  before_action :is_super_admin?
  def index
  end
end