class UsersController < ApplicationController
  before_action :is_super_admin?
  before_action :set_user, only: [:user_tag, :destroy_tag, :pass_auth, :dyne_auth, :show]

  def index
    @tags = Tag.all
    @tags = filter_page @tags
  end

  def show
    @tags = Tag.all
  end

  def user_tag
   unless @user.user_tags.find_by(tag_id: params[:tag_id])
     @user.user_tags.create(tag_id: params[:tag_id])
     flash[:success] = "添加成功"
   else
     flash[:error] = "标签已经存在"
   end
   if params[:module] == "user_show"
     redirect_to user_path(@user)
   else
     redirect_to treated_auth_applies_path(user_id: @user.id)
   end

  end

  def destroy_tag
    tag = @user.user_tags.find_by(tag_id: params[:tag_id])
    tag.destroy
    flash[:success] = "删除成功"
    redirect_to treated_auth_applies_path(user_id: @user.id)
  end


  def pass_auth
    User.transaction do
      @user.update(identify_status: User.identify_statuses[:ok])
      @user.auth_apply.update(status: AuthApply.statuses[:treated])

      flash[:success] = "认证成功"
      redirect_to treated_auth_applies_path(user_id: @user.id)
    end
  end

  def dyne_auth
    User.transaction do
      @user.auth_apply.update(status: AuthApply.statuses[:dyne])

      flash[:error] = "拒绝认证成功"
      redirect_to treated_auth_applies_path(user_id: @user.id)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end