# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.credentials[Rails.env.to_sym][:google][:client_id],
           Rails.application.credentials[Rails.env.to_sym][:google][:client_secret]
end
