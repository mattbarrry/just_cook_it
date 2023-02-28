# frozen_string_literal: true

class AuthController < ApplicationController
  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_login_path
    end
  end
end
