require 'rails_helper'

RSpec.describe "Recipes API" do
  describe "Recipe Index" do
    it "returns all relevant recipe attributes for recipes from a country search", :vcr do
      get "/api/v1/recipes?country=thailand"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.first[:id]).to be(nil)
      expect(data.first[:type]).to eq("recipe")
      expect(data.first[:attributes][:title]).to be_a(String)
      expect(data.first[:attributes][:url]).to be_a(String)
      expect(data.first[:attributes][:country]).to eq("thailand")
      expect(data.first[:attributes][:image]).to be_a(String)
    end
    
    it "returns all relevant recipe attributes for recipes from an empty search", :vcr do
      data = {name: { common: "Suriname"} }
      suriname = Country.new(data)
      allow_any_instance_of(CountryFacade).to receive(:random_country).and_return(suriname)

      get "/api/v1/recipes?country="

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.first[:id]).to be(nil)
      expect(data.first[:type]).to eq("recipe")
      expect(data.first[:attributes][:title]).to be_a(String)
      expect(data.first[:attributes][:url]).to be_a(String)
      expect(data.first[:attributes][:country]).to be_a(String)
      expect(data.first[:attributes][:image]).to be_a(String)
    end

  end
end