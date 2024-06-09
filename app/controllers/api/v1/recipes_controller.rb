class Api::V1::RecipesController < ApplicationController 
  # def index
  #   if params[:country].blank?
  #     country = CountryFacade.new.random_country.name
  #     recipes = RecipeFacade.new.recipes_by_country(country)
  #   else
  #     recipes = RecipeFacade.new.recipes_by_country(params[:country])
  #   end
  #   render json: RecipeSerializer.new(recipes), status: :ok
  # end

  def index
    country = params[:country].presence || CountryFacade.new.random_country.name
    recipes = RecipeFacade.new.recipes_by_country(country)
    render json: RecipeSerializer.new(recipes), status: :ok
  end
end