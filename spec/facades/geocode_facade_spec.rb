require "rails_helper"

RSpec.describe GeocodeFacade do
  describe "lat_and_lon_from" do
    it "returns a hash ", :vcr do
      query = "thailand"
      geocode = GeocodeFacade.new.lat_and_lon_from(query)
      
      expect(geocode).to be_a(Geocode)
      expect(geocode.lat).to be_a(Float)
      expect(geocode.lon).to be_a(Float)
    end
  end
end