class RecipesController < ApplicationController
  def show
    @recipe = RecipeRetrievalService.new(params[:url])

    respond_to do |format|
      format.html
      format.json { render json: @recipe }
    end
  end
end
