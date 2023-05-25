# frozen_string_literal: true

# Controlador de parametros permitidos
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name last_name run phone address birth_date
                                               pay_method email password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name last_name run phone address
                                               birth_date pay_method email password
                                               password_confirmation current_password moderator admin])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login username email password remember_me])
  end
end
