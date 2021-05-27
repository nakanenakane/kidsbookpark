class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth, if: :production?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  protected
    def configure_permitted_parameters
        if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email,:password,:first_name,:family_name,:first_name_kana,:family_name_kana,:birth_date])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:email, :password])
    end
  end
end
