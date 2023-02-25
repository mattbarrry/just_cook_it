# frozen_string_literal: true

module Recipes
  class Step < ViewComponent::Base
    with_collection_parameter :step

    def initialize(step:)
      @step = step
    end
  end
end
