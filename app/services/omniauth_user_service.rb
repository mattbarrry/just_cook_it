# frozen_string_literal: true

class OmniauthUserService
  def initialize(response)
    @uid = response[:uid]
    @provider = response[:provider]
    @email = response[:info][:email]
    @info = response[:info]
  end

  def find_user
    if user_exists_and_synced.present?
      user_exists_and_synced
    elsif email_exists_not_synced?
      sync_user_to_google
    else
      create_new_user
    end
  end

  private

  def user_exists_and_synced
    User.find_by(uid: @uid, provider: @provider, email: @email)
  end

  def email_exists_not_synced?
    User.find_by(uid: @uid, provider: @provider).nil? && User.find_by(email: @email).present?
  end

  def sync_user_to_google
    u = User.find_by(email: @email)
    u.uid = @uid
    u.provider = @provider
    u.name = @info[:name]
    u.save
    u
  end

  def create_new_user
    User.create! do |u|
      u.email = @email
      u.uid = @uid
      u.provider = @provider
      u.name = @info[:name]
      u.password = SecureRandom.hex(16)
    end
  end
end
