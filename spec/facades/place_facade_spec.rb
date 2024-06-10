require "rails_helper"

RSpec.describe PlaceFacade do
  describe "tourist_sites_from" do
    it "returns an array of tourist sites", :vcr do
      lon = 1.9064693850950118
      lat = 46.6005083
      places = PlaceFacade.new.tourist_sites_from(lat, lon)
      
      expect(places).to be_an(Array)
      expect(places.count).to eq 10
      places.each do |place|
        expect(place).to be_a(Place)
        expect(place.name).to be_a(String)
        expect(place.address).to be_a(String)
        expect(place.place_id).to be_a(String)
      end
    end
  end
end