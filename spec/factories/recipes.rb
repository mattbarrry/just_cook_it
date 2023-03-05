# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    add_attribute(:user) { FactoryBot.create :user }
    add_attribute(:url) { Faker::Internet.url }
    add_attribute(:name) { Faker::Lorem.sentence word_count: 5 }
    add_attribute(:description) { Faker::Lorem.sentences number: 3 }
  end
end
