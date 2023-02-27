# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :load_current_user

  def sign_in_user(user)
    session[:user_id] = user.id.to_s
    redirect_to root_url, notice: 'Logged in successfully!'
  end

  def login_required
    redirect_to new_login_path unless @current_user.present?
  end

  private

  def load_current_user
    @current_user = session[:user_id].present? ? User.find_by_id(session[:user_id]) : nil
  end
end
