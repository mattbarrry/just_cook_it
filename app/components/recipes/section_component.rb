# frozen_string_literal: true

module Recipes
  class SectionComponent < ViewComponent::Base
    renders_many :steps, Recipes::StepComponent
    def initialize(section:)
      @section = section
    end
  end
end
