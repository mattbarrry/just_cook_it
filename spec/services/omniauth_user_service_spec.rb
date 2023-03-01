# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OmniauthUserService, type: :model do
  describe '.find_user' do
    let(:response) do
      {
        uid: uid,
        provider: provider,
        info: {
          email: email,
          name: name
        }
      }
    end
    subject { described_class.new(response).find_user }

    context 'when the user exists and is synced' do
      let(:user) { FactoryBot.create :user }
      let(:uid) { user.uid }
      let(:provider) { user.provider }
      let(:name) { user.name }
      let(:email) { user.email }

      it 'returns the user' do
        expect(subject).to eq user
      end
    end

    context 'when the email exists with no uid or provider' do
      let(:user) { FactoryBot.create :user, uid: nil, provider: nil }
      let(:email) { user.email }
      let(:name) { user.name }
      let(:uid) { Faker::Internet.uuid }
      let(:provider) { Faker::Lorem.word }

      it 'returns the correct user account based on email address' do
        expect(subject).to eq user
      end

      it 'updates the user with the uid and provider' do
        subject
        updated_user = User.find_by(email: email)

        expect(updated_user.uid).to eq uid
        expect(updated_user.provider).to eq provider
      end
    end

    context 'when neither the email or omniauth info exists' do
      let(:email) { Faker::Internet.email }
      let(:name) { Faker::Name.name }
      let(:uid) { Faker::Internet.uuid }
      let(:provider) { Faker::Lorem.word }

      it 'creates a new user with the attributes passed over from google' do
        subject
        new_user = User.find_by(email: email)

        expect(new_user.name).to eq name
        expect(new_user.email).to eq email
        expect(new_user.uid).to eq uid
        expect(new_user.provider).to eq provider
      end
    end
  end
end
