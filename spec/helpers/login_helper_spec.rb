# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoginHelper, type: :helper do
  describe '.google_login_button' do
    subject { helper.google_login_button }

    it 'returns a login with google button' do
      expect(subject).to have_tag('form', with: { action: '/auth/google_oauth2' })
      expect(subject).to have_tag('button', text: 'Login with Google')
    end
  end
end
