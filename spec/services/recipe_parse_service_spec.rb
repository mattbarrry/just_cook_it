# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeParseService, type: :model do
  let(:recipe) do
    {
      recipeInstructions: instructions,
      recipeIngredient: ingredients,
      author: author,
      name: name,
      description: description
    }
  end
  let(:url) { Faker::Internet.url }

  subject { described_class.new(recipe, url) }

  describe '.sections' do

  end

  describe '.steps' do

  end

  describe '.ingredients' do

  end

  describe '.author' do

  end

  describe '.name' do

  end

  describe '.description' do

  end

  describe '.step_sections?' do

  end
end
