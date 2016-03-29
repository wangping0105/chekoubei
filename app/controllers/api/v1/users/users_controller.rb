class Api::V1::Users::UsersController < Api::V1::BaseController
  before_action :set_user, only:[ :show]

  def show
  end

  def auth_apply
    param! :true_name, String, required: true
    param! :job, String, required: true
    param! :invite_phones, Array, required: true

    attr = {
        user: current_user,
        true_name: params[:true_name],
        extra: {
            job: params[:job],
            invite_phones: params[:invite_phones]
        }
    }
    if AuthApply.create(attr)
      normal_render
    else
      raise EntityValidationError.new("申请失败!")
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end