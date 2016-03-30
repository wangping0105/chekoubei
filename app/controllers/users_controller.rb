class UsersController < ApplicationController
  before_action :is_super_admin?
  before_action :set_user, only: [:user_tag, :destroy_tag, :pass_auth]

  def index
    @tags = Tag.all
    @tags = filter_page @tags
  end

  def user_tag
   unless @user.user_tags.find_by(tag_id: params[:tag_id])
     @user.user_tags.create(tag_id: params[:tag_id])
     flash[:success] = "添加成功"
   else
     flash[:error] = "标签已经存在"
   end
   redirect_to treated_auth_applies_path(user_id: @user.id)
  end

  def destroy_tag
    tag = @user.user_tags.find_by(tag_id: params[:tag_id])
    tag.destroy
    flash[:success] = "删除成功"
    redirect_to treated_auth_applies_path(user_id: @user.id)
  end


  def pass_auth
    @user.update(identify_status: User.identify_statuses[:ok])

    flash[:success] = "认证成功"
    redirect_to treated_auth_applies_path(user_id: @user.id)
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end