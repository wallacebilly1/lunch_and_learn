require "rails_helper"

RSpec.describe Geocode do
  before(:each) do
    @geocode_attr = {
      "type": "Feature",
      "properties": {
          "datasource": {
              "sourcename": "openstreetmap",
              "attribution": "© OpenStreetMap contributors",
              "license": "Open Database License",
              "url": "https://www.openstreetmap.org/copyright"
          },
          "country": "France",
          "country_code": "fr",
          "lon": 1.8883335,
          "lat": 46.603354,
          "result_type": "country",
          "formatted": "France",
          "address_line1": "France",
          "address_line2": "",
          "category": "administrative",
          "timezone": {
              "name": "Europe/Paris",
              "offset_STD": "+01:00",
              "offset_STD_seconds": 3600,
              "offset_DST": "+02:00",
              "offset_DST_seconds": 7200,
              "abbreviation_STD": "CET",
              "abbreviation_DST": "CEST"
          },
          "plus_code": "8FR3JV3Q+88",
          "rank": {
              "importance": 1.0233264437396503,
              "popularity": 5.325744118786215,
              "confidence": 1,
              "match_type": "match_by_country_or_state"
          },
          "place_id": "51390f27309d36fe3f5995f430b43a4d4740f00101f901329a210000000000c0020b"
      },
      "geometry": {
          "type": "Point",
          "coordinates": [
              1.8883335,
              46.603354
          ]
      },
      "bbox": [
          -178.3873749,
          -50.2187169,
          172.3057152,
          51.3055721
      ]
  }

    @geocode = Geocode.new(@geocode_attr)
  end

  it "exists" do
    expect(@geocode).to be_a Geocode
    expect(@geocode.lat).to eq(46.603354)
    expect(@geocode.lon).to eq(1.8883335)
  end
end