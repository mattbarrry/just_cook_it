# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipes::Section, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to belong_to(:recipe) }
end
