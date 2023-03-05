# frozen_string_literal: true

module RecipeHelper
  def sanitize_recipe_text(text)
    sanitize text, tags: %w[strong em a], attributes: %w[href]
  end
end
