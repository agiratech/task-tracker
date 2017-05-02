# frozen_string_literal: true
# frozen_string_literal = true
class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery prepend: true, with: :exception
  protect_from_forgery with: :exception
  respond_to :json, :html
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  def authenticate_current_user
    head :unauthorized if present_user.nil?
  end

  def present_user
    return nil unless cookies[:auth_headers]
    auth_headers = JSON.parse(cookies[:auth_headers])
    expiration_datetime = DateTime.strptime(auth_headers['expiry'], '%s')
    current_user = Employee.find_by(uid: auth_headers['uid'])
    if current_user &&
       current_user.tokens.key?(auth_headers['client']) &&
       expiration_datetime > DateTime.now
      @current_user = current_user
    end
    @current_user
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [
                                          :first_name, :last_name, :code
                                        ])
    end
end
