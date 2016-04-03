class Api::V1::Users::UsersController < Api::V1::BaseController
  before_action :set_user, only:[ :show]

  def show
    param! :user_id, Integer, required: false

    @user = User.find(params[:user_id]) if params[:user_id]
  end

  def update
    param! :user, Hash, required: true

    @user = currnt_user.update(user_params)
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
    if @user.auth_apply
      raise EntityValidationError.new("您已经申请认证!")
    else
      if AuthApply.create(attr)
        normal_render
      else
        raise EntityValidationError.new("申请失败!")
      end
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit([:name, :sex, :nickname,
      address_attributes: [:tel, :zip, :fax, :url, :detail_address, :phone, :province_id, :city_id, :country_id, :district_id, :email, :qq, :wechat, :wangwang, :id]
    ])
  end
end
