require 'rails_helper'

RSpec.describe "Learning Resources API" do
  describe "Learning Resources Index" do
    it "returns photo and video information from a country search", :vcr do
      get "/api/v1/learning_resources?country=laos"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to be(nil)
      expect(data[:type]).to eq("learning_resource")
      expect(data[:attributes][:country]).to eq("laos")
      
      expect(data[:attributes][:video][:title]).to be_a(String)
      expect(data[:attributes][:video][:youtube_video_id]).to be_a(String)

      expect(data[:attributes][:images]).to be_an(Array)
      expect(data[:attributes][:images].count).to eq(10)
      data[:attributes][:images].each do |image|
        expect(image[:alt_tag]).to be_a(String)
        expect(image[:url]).to be_a(String)
      end
    end

    it "returns an empty object if the query returns no results", :vcr do
      get "/api/v1/learning_resources?country=jaskdfljiencknkdkkee"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to be(nil)
      expect(data[:type]).to eq("learning_resource")
      expect(data[:attributes][:country]).to eq("jaskdfljiencknkdkkee")

      expect(data[:attributes][:video]).to eq({})

      expect(data[:attributes][:images]).to be_an(Array)
      expect(data[:attributes][:images].count).to eq(0)
    end
  end
end