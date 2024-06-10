class Api::V1::TouristSitesController < ApplicationController 
  def index
    country = params[:country]
    geocode = GeocodeFacade.new.lat_and_lon_from(country)
    lat = geocode.lat
    lon = geocode.lon
    places = PlaceFacade.new.tourist_sites_from(lat,lon)

    render json: TouristSitesSerializer.new(places) status: :ok
  end
end