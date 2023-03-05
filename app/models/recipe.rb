# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :recipe_sections, class_name: 'Recipes::Section', dependent: :destroy
  has_many :recipes_steps, through: :recipe_sections

  alias_attribute :sections, :recipe_sections
  alias_attribute :steps, :recipe_steps
end
