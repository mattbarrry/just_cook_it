# frozen_string_literal: true

module Recipes
  class Section < ApplicationRecord
    self.table_name = 'recipe_sections'

    validates :name, presence: true

    belongs_to :recipe
  end
end
