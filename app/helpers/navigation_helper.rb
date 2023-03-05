# frozen_string_literal: true

module NavigationHelper
  def brand_logo_link
    link_to root_path, class: 'navbar-item' do
      image_tag 'logo-no-background.png'
    end
  end

  def top_nav_right_buttons
    @current_user.present? ? account_dropdown : login_signup_buttons
  end

  private

  def login_signup_buttons
    content_tag :div, class: 'navbar-item' do
      content_tag :div, class: 'buttons' do
        (link_to 'Sign up', root_path, class: 'button is-primary') +
          (link_to 'Log in', new_login_path, class: 'button is-light')
      end
    end
  end

  # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
  def account_dropdown
    content_tag :div, class: 'navbar-item has-dropdown is-hoverable is-right' do
      (link_to 'Account', root_path, class: 'navbar-link') +
        (content_tag :div, class: 'navbar-dropdown is-right' do
          (link_to 'My Recipes', root_path, class: 'navbar-item') +
            (link_to 'Account Settings', root_path, class: 'navbar-item') +
            (tag.hr class: 'navbar-divider') +
            (link_to 'Report an Issue', root_path, class: 'navbar-item') +
            (tag.hr class: 'navbar-divider') +
            (link_to 'Log out', logout_path, class: 'navbar-item')
        end)
    end
  end
  # rubocop:enable Metrics/MethodLength,Metrics/AbcSize
end
