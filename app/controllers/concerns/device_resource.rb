module DeviceResource
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    keys = %i[password password_confirmation current_password]
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end

  protected

  def after_sign_in_path_for(_resource)
    dashboard_mailing_lists_path
  end
end
