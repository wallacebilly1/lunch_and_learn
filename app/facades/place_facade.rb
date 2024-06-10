class PlaceFacade
  def tourist_sites_from(lat, lon)
    json = service.tourist_sites_from(lat, lon)
    @places = json[:features].map { |details| Place.new(details) }
  end

  private

  def service
    PlaceService.new
  end
end