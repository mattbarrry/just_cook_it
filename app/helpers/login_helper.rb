# frozen_string_literal: true

module LoginHelper
  def google_login_button
    button_to '/auth/google_oauth2', class: 'button', method: :post, data: { turbo: false } do
      image_tag('google-g-logo.png',
                width: '20px',
                style: 'margin-bottom:3px; margin-right:5px') << 'Login with Google'
    end
  end
end
