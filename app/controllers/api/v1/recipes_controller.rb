class Api::V1::RecipesController < ApplicationController 
  def index
    country = params[:country].presence || CountryFacade.new.random_country.name
    recipes = RecipeFacade.new.recipes_by_country(country)
    render json: RecipeSerializer.new(recipes), status: :ok
  end
end