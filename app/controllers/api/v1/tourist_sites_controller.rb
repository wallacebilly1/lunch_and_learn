class Api::V1::TouristSitesController < ApplicationController 
  def index
    country = params[:country]

    render json: TouristSitesSerializer.new() status: :ok
  end
end