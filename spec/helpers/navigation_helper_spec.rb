# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NavigationHelper, type: :helper do
  describe '.brand_logo_link' do
    subject { helper.brand_logo_link }

    it 'shows the brand logo link with a root url' do
      expect(subject).to have_tag(:a, with: { href: root_path }) do
        with_tag :img
      end
    end
  end

  describe '.top_nav_right_buttons' do
    subject { helper.top_nav_right_buttons }

    context 'when there is a logged in user' do
      let(:current_user) { FactoryBot.create :user }
      before :each do
        instance_variable_set(:@current_user, current_user)
      end

      it 'displays a dropdown menu with user context' do
        expect(subject).to have_tag(:a, text: 'Account')
      end
    end

    context 'when there is no logged in user' do
      it 'shows login and signup buttons' do
        expect(subject).to have_tag(:a, text: 'Sign up')
        expect(subject).to have_tag(:a, text: 'Log in', with: { href: new_login_path })
      end
    end
  end
end
