class Api::V2::UserDevicesController < Api::V2::BaseController
  before_action :check_platform
  before_action :user_device

  def create
    if user_device_params[:platform] == 'igetui'
      deal_igetui
    end

    render json: { code: 0, data: { user_device: user_device } }
  end

  private
  def user_device_params
    params.require(:user_device).permit(:platform, :device_token, :client_id, :device_model,
                                        :device_id, :device_version, :device_phone)
  end

  def check_platform
    raise EntityValidationError.new('platform must be provided correctly') unless %w(igetui).include?(user_device_params[:platform])
  end

  def check_client_id
    raise EntityValidationError.new('必须提供client_id') unless user_device_params[:client_id]
  end

  def deal_igetui
    check_client_id
    UserDevice.where(client_id: user_device.client_id).where.not(id: user_device.id, user_id: user_device.user_id).map(&:destroy)
    signed_in_user_devices = current_user.user_devices.where.not(id: user_device.id)

    signed_in_user_devices.map(&:destroy)

    user_device.assign_attributes({client_id: user_device_params[:client_id], platform: user_device_params[:platform],
                                   device_platform: current_app.app_type, organization_id: current_user.organization_id}.merge(log_attributes))
    user_device.save
  end

  def log_attributes
    user_device_params.slice( *%w(device_model device_id device_version device_phone) ).merge!(ip: request.ip)
  end

  def user_device
    @device ||= current_user.user_devices.where(client_id: user_device_params[:client_id]).first_or_create
  end
end
