# frozen_string_literal: true

module Recipes
  class StepComponent < ViewComponent::Base
    include RecipeHelper

    def initialize(step:)
      @step = step
    end
  end
end
