class AuthAppliesController < ApplicationController
  before_action :is_super_admin?

  def index
    @auth_applies = AuthApply.includes(:user).order(status: :asc).order(id: :desc)
    @auth_applies = filter_page(@auth_applies)
  end

  def treated
    user = User.find params[:user_id]
    @auth_apply = user.try(:auth_apply)
    if @auth_apply
      @invite_users =  User.where(phone: @auth_apply.extra[:invite_phones])
    else
      flash[:error] = "不存在申请!"
      redirect_to auth_applies_path
    end
  end
end