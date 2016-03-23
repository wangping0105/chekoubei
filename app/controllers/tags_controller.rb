class TagsController < ApplicationController
  before_action :is_super_admin?
  def index
    @tags = Tag.all
    @tags = filter_page @tags
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to tags_path
  end

  def user_tag

  end

  private
  def tag_params
    (params.require(:tag).permit(:name))
  end
end