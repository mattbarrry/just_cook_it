# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeParseService, type: :model do
  let(:name) { Faker::Lorem.words number: 5 }
  let(:description) { Faker::Lorem.sentences number: 2 }
  let(:author) { {} }
  let(:ingredients) { {} }
  let(:instructions) { {} }
  let(:recipe) do
    {
      'recipeInstructions' => instructions,
      'recipeIngredient' => ingredients,
      'author' => author,
      'name' => name,
      'description' => description
    }
  end
  let(:url) { Faker::Internet.url }

  subject { described_class.new(recipe, url) }

  describe '.sections' do
    context 'when the recipe has step sections' do
      let(:instructions) do
        3.times.collect do
          {
            '@type' => 'HowToSection',
            'name' => Faker::Lorem.sentence,
            'itemListElement' => [
              3.times.collect do
                {
                  '@type' => 'HowToStep',
                  'text' => Faker::Lorem.sentence
                }
              end
            ]
          }
        end
      end

      it 'returns the recipe step sections' do
        expect(subject.sections).to be_a(Array)
        expect(subject.sections.first).to eq instructions.first
      end
    end

    context 'when the recipe does not have sections' do
      xit 'it raises a no recipe sections error' do; end
    end
  end

  describe '.steps' do
    context 'when the recipe only has steps (no sections)' do
      let(:instructions) do
        3.times.collect do
          {
            '@type' => 'HowToStep',
            'name' => Faker::Lorem.sentence
          }
        end
      end

      it 'returns the recipe steps' do
        expect(subject.steps).to be_a(Array)
        expect(subject.steps.first).to eq instructions.first
      end
    end

    context 'when the receipt has sections' do
      xit 'returns a recipe has sections error' do; end
    end
  end

  describe '.ingredients' do
    let(:ingredients) do
      5.times.collect do |_|
        "#{Faker::Number.number digits: 1} #{Faker::Lorem.words number: 3}"
      end
    end

    it 'returns an array of ingredients' do
      expect(subject.ingredients).to be_a(Array)
      expect(subject.ingredients.first).to eq ingredients.first
    end
  end

  describe '.author' do
    context 'when the author is an array' do
      let(:author) do
        [
          {
            '@type': 'Person',
            name: Faker::Internet.name
          },
          {
            '@type': 'Person',
            name: Faker::Internet.name
          }
        ]
      end

      it 'returns the first author object' do
        expect(subject.author).to eq author.first
      end
    end

    context 'when the author is an object' do
      let(:author) do
        {
          '@type': 'Person',
          name: Faker::Internet.name
        }
      end

      it 'returns the author object' do
        expect(subject.author).to eq author
      end
    end
  end

  describe '.name' do
    it 'returns the name of the recipe' do
      expect(subject.name).to eq name
    end
  end

  describe '.description' do
    it 'returns the description of the receipt' do
      expect(subject.description).to eq description
    end
  end

  describe '.step_sections?' do
    context 'when the recipe has sections' do
      let(:instructions) do
        [
          {
            '@type' => 'HowToSection'
          }
        ]
      end

      it 'returns true' do
        expect(subject.step_sections?).to be_truthy
      end
    end

    context 'when the recipe does not have sections' do
      let(:instructions) do
        [
          {
            '@type' => 'HowToStep'
          }
        ]
      end

      it 'returns false' do
        expect(subject.step_sections?).to be_falsey
      end
    end
  end
end
