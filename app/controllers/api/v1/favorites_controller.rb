class Api::V1::FavoritesController < ApplicationController
  before_action :find_user

  def create
    if @current_user.present?
      @current_user.favorites.create!(favorite_params)
      render json: { success: "Favorite added successfully" }
    else
      render json: { error: 'Invalid api_key' }, status: :unauthorized
    end
  end

  def index
    favorites = @current_user.favorites

    render json: FavoriteSerializer.new(favorites).serializable_hash
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end

  def find_user
    @current_user = User.find_by(api_key: params[:api_key])
  end
end