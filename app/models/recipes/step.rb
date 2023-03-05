# frozen_string_literal: true

module Recipes
  class Step < ApplicationRecord
    self.table_name = 'recipe_steps'

    validates :instruction, presence: true

    belongs_to :recipes_section, class_name: 'Recipes::Section'
  end
end
