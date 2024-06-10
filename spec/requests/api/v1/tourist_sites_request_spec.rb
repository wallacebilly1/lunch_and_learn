require 'rails_helper'

RSpec.describe "Tourist Sites API" do
  describe "Tourist Sites Index" do
    it "returns a list of ten tourist sites with their name, address, and place_id for a given country", :vcr do
      get "/api/v1/tourist_sites?country=France"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.count).to eq(10)

      expect(data.first[:id]).to be(nil)
      expect(data.first[:type]).to eq("tourist_site")
      expect(data.first[:attributes][:name]).to be_a(String)
      expect(data.first[:attributes][:address]).to be_a(String)
      expect(data.first[:attributes][:place_id]).to be_a(String)
      expect(data.first[:attributes]).not_to have_key(:source)
      expect(data.first[:attributes]).not_to have_key(:health_labels)
      expect(data.first[:attributes]).not_to have_key(:ingredients)
    end
  end
end
