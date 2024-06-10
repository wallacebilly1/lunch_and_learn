class GeocodeFacade
  def lat_and_lon_from(country)
    json = service.lat_and_lon_from(country)
    @geocode = Geocode.new(json[:features].first)
  end

  private

  def service
    GeocodeService.new
  end
end