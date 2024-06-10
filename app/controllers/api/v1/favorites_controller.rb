class Api::V1::FavoritesController < ApplicationController
  before_action :find_user

  def create
    if @user.present?
      @user.favorites.create!(favorite_params)
      render json: { success: "Favorite added successfully" }
    else
      render json: { error: 'Invalid api_key' }, status: :unauthorized
    end
  end

  private

  def favorite_params
    params.permit(:country, :recipe_link, :recipe_title)
  end

  def find_user
    @user = User.find_by(api_key: params[:api_key])
  end
end