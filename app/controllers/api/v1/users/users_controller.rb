class Api::V1::Users::UsersController < Api::V1::BaseController

  def auth_apply
    param! :true_name, String, required: true
    param! :job, String, required: true
    param! :invite_phones, Array, required: true

    attr = {
        true_name: params[:true_name],
        extra: {job: params[:job]},
        phone: current_user.phone
    }
    AuthApply.transaction do
      begin
        params[:invite_phones].each do |invite_phone|
          attr[:invite_phone]=invite_phone
          current_user.auth_applies.create(attr)
        end
        normal_render
      rescue
        raise EntityValidationError.new("申请失败!")
      end
    end
  end
end