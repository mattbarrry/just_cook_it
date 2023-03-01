# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    add_attribute(:email) { Faker::Internet.email }
    add_attribute(:name) { Faker::Name.name }
    add_attribute(:password) { Faker::Internet.password }
    add_attribute(:uid) { Faker::Internet.uuid }
    add_attribute(:provider) { 'google_oauth2' }
  end
end
