require "rails_helper"

RSpec.describe Place do
  before(:each) do
    @place_attr = {
      "type": "Feature",
      "properties": {
          "name": "Château de Sarzay",
          "country": "France",
          "country_code": "fr",
          "region": "Metropolitan France",
          "state": "Centre-Val de Loire",
          "county": "Indre",
          "city": "Sarzay",
          "isolated_dwelling": "La Métairie",
          "municipality": "La Châtre",
          "postcode": "36230",
          "street": "D 41",
          "lon": 1.9064693850950118,
          "lat": 46.6005083,
          "state_code": "CVL",
          "state_COG": "24",
          "formatted": "Château de Sarzay, D 41, 36230 Sarzay, France",
          "address_line1": "Château de Sarzay",
          "address_line2": "D 41, 36230 Sarzay, France",
          "categories": [
              "building",
              "building.historic",
              "building.tourism",
              "fee",
              "heritage",
              "tourism",
              "tourism.attraction",
              "tourism.sights",
              "tourism.sights.castle"
          ],
          "details": [
              "details",
              "details.building",
              "details.heritage",
              "details.historic",
              "details.wiki_and_media"
          ],
          "datasource": {
              "sourcename": "openstreetmap",
              "attribution": "© OpenStreetMap contributors",
              "license": "Open Database License",
              "url": "https://www.openstreetmap.org/copyright",
              "raw": {
                  "fee": "yes",
                  "name": "Château de Sarzay",
                  "height": 25,
                  "osm_id": 258316522,
                  "ref:mhs": "PA00097467",
                  "tourism": "attraction",
                  "website": "https://sarzay.net/",
                  "building": "yes",
                  "heritage": 2,
                  "historic": "castle",
                  "osm_type": "w",
                  "wikidata": "Q950709",
                  "wikipedia": "fr:Château de Sarzay",
                  "castle_type": "defensive",
                  "building:part": "no",
                  "heritage:operator": "mhs",
                  "mhs:inscription_date": "1912-01-29"
              }
          },
          "website": "https://sarzay.net/",
          "ref_other": {
              "mhs": "PA00097467"
          },
          "wiki_and_media": {
              "wikidata": "Q950709",
              "wikipedia": "fr:Château de Sarzay"
          },
          "historic": {
              "type": "castle",
              "castle_type": "defensive"
          },
          "heritage": {
              "level": 2,
              "operator": "mhs",
              "ref": "PA00097467",
              "inscription_date": "1912-01-29"
          },
          "building": {
              "height": 25
          },
          "place_id": "51d6eebc0ae680fe3f59c040bb74dd4c4740f00102f901ea98650f000000009203124368c3a274656175206465205361727a6179"
      },
      "geometry": {
          "type": "Point",
          "coordinates": [
              1.9064693850950127,
              46.60050830023965
          ]
      }
  }

    @place = Place.new(@place_attr)
  end

  it "exists" do
    expect(@place).to be_a Place
    expect(@place.name).to eq("Château de Sarzay")
    expect(@place.address).to eq("Château de Sarzay, D 41, 36230 Sarzay, France")
    expect(@place.place_id).to eq("51d6eebc0ae680fe3f59c040bb74dd4c4740f00102f901ea98650f000000009203124368c3a274656175206465205361727a6179")
  end
end