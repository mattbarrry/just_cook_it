# frozen_string_literal: true

class AuthController < ApplicationController
  def omniauth
    user = OmniauthUserService.new(request.env['omniauth.auth']).find_user
    if user.valid?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      redirect_to new_login_path, alert: 'Issue logging in.'
    end
  end
end
