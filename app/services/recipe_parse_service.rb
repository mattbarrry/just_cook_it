# frozen_string_literal: true

class RecipeParseService

  attr_reader :recipe, :url

  def initialize(recipe, original_url)
    @recipe = recipe
    @url = parse_url(original_url)
  end

  def sections
    recipe['recipeInstructions'].select { |section| section['@type'] == 'HowToSection' }
  end

  def steps
    recipe['recipeInstructions']
  end

  def ingredients
    recipe['recipeIngredient']
  end

  def author
    recipe['author'].is_a?(Array) ? recipe['author'][0] : recipe['author']
  end

  def name
    recipe['name']
  end

  def description
    recipe['description']
  end

  # Returns true if the recipe has a HowToSection as the first type\
  # HowToSection = sections of steps, HowToStep = steps
  def step_sections?
    recipe['recipeInstructions'][0]['@type'] == 'HowToSection'
  end

  private

  def parse_url(original_url)
    uri = URI.parse(original_url)
    "#{uri.scheme}://#{uri.host}#{uri.path}"
  end
end
