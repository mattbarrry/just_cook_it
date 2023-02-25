# frozen_string_literal: true

module Recipes
  class Ingredient < ViewComponent::Base
    with_collection_parameter :ingredient

    def initialize(ingredient:)
      @ingredient = ingredient
    end
  end
end
