require 'rails_helper'

RSpec.describe Recipes::Step, type: :model do
  it { is_expected.to validate_presence_of(:instruction) }
end
