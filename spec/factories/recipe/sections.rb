# frozen_string_literal: true

FactoryBot.define do
  factory :recipe_section, class: 'Recipes::Section' do
    add_attribute(:recipe) { FactoryBot.create :recipe }
    add_attribute(:name) { Faker::Lorem.sentence word_count: 5 }
  end
end
