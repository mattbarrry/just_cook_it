# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecipeRetrievalService, type: :model do
  describe '.new' do
    before :each do
      stub_request(:get, url).to_return(body: raw_response_file.read, status: 200)
    end

    context 'serious eats' do
      let(:url) { 'https://www.seriouseats.com/creme-anglaise-recipe-7108153' }
      let(:raw_response_file) { File.open('spec/fixtures/recipes/serious_eats.html') }

      it 'returns a hash' do
        recipe = described_class.new(url).recipe
        expect(recipe).to be_a Hash
      end
    end

    context 'recipe tin eats' do
      let(:url) { 'https://www.recipetineats.com/vietnamese-pho-recipe/' }
      let(:raw_response_file) { File.open('spec/fixtures/recipes/serious_eats.html') }

      it 'returns a hash' do
        recipe = described_class.new(url).recipe
        expect(recipe).to be_a Hash
      end
    end

    context 'forked spoon' do
      let(:url) { 'https://theforkedspoon.com/pho-recipe/' }
      let(:raw_response_file) { File.open('spec/fixtures/recipes/forked_spoon.html') }

      it 'returns a hash' do
        recipe = described_class.new(url).recipe
        expect(recipe).to be_a Hash
      end
    end

    context 'ny times' do
      let(:url) { 'https://cooking.nytimes.com/recipes/1023791-baked-fish-with-mushrooms-and-ginger' }
      let(:raw_response_file) { File.open('spec/fixtures/recipes/ny_times.html') }

      it 'returns a hash' do
        recipe = described_class.new(url).recipe
        expect(recipe).to be_a Hash
      end
    end
  end
end
