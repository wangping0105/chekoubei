class UsersController < ApplicationController
  before_action :is_super_admin?

  def index
    @tags = Tag.all
    @tags = filter_page @tags
  end

  def user_tag

  end
end