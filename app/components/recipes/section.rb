# frozen_string_literal: true

module Recipes
  class Section < ViewComponent::Base
    renders_many :steps, Recipes::Step
    def initialize(section:)
      @section = section
    end
  end
end
