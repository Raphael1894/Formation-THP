# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :nickname, :password, :siret, :website, :description, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :nickname, :password, :siret, :website, :description, :password_confirmation)
    end
  end
end
