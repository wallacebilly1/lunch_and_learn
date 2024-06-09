class Api::V1::RecipesController < ApplicationController 
  def index
    country = (params[:country].presence || CountryFacade.new.random_country.name)
    video = VideoFacade.new.videos_from(country)
    photos = PhotoFacade.new.photos_from(country)

    if video == {}
      render json: LearningResourcesSerializer.serialize_no_videos(country), status: :ok
    else
      render json: LearningResourcesSerializer.serialize(country, video, photos), status: :ok
  end
end