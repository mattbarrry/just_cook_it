# frozen_string_literal: true

class LoginsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])

    sign_in_user(user) && return if user&.authenticate(params[:password])

    redirect_to new_login_path, alert: 'Login failed.'
  end

  def destroy
    session.clear
    redirect_to new_login_path, notice: 'Successfully logged out.'
  end
end
