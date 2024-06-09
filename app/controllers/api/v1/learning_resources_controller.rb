class Api::V1::LearningResourcesController < ApplicationController 
  def index
    country = (params[:country].presence || CountryFacade.new.random_country.name)
    video = VideoFacade.new.video_from(country)
    photos = PhotoFacade.new.photos_from(country)

    render json: LearningResourcesSerializer.new({ country: country, video: video, photos: photos }).serializable_hash, status: :ok
  end
end