# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
end
