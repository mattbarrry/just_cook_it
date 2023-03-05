# frozen_string_literal: true

module Recipes
  class Step < ViewComponent::Base
    include RecipeHelper

    def initialize(step:)
      @step = step
    end
  end
end
