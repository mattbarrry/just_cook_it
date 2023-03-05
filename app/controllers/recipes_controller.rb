# frozen_string_literal: true

class RecipesController < ApplicationController
  def show
    recipe_object = RecipeRetrievalService.new(params[:url])
    @recipe = RecipeParseService.new(recipe_object.recipe, params[:url])

    respond_to do |format|
      format.html
      format.json { render json: @recipe }
    end
  end
end
