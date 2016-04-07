class Api::V1::Users::VersionsController < Api::V1::BaseController
  def lastest_version
    param! :device, String, required: true, in: ['android', 'ios']

    app_version = AppVersion.where(app_type: AppVersion::app_types[params[:device]]).last
    app_version = init_version unless app_version.present?

    render json: {
      code: 0,
      data: AppVersionSerializer.new(app_version)
    }
  end

  private
  def init_version
    AppVersion.create(
        app_type: AppVersion::app_types[params[:device]],
        name: 'chekoubei',
        version_name: '1.0.0',
        version_code: '1.0.0'
    )
  end
end
