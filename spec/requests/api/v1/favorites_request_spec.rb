require 'rails_helper'

RSpec.describe "Favorites API" do
  before(:each) do
    user_attr = {
        name: "Odell",
        email: "goodboy@ruffruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      
    @user = User.create(user_attr)

    @user.reload


  end

  describe "Favorite Create" do
    it "can create a favorite" do
      body_data = {
        api_key: @user.api_key,
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }
      
      post "/api/v1/favorites", params: body_data

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:success]).to eq ("Favorite added successfully")

    end

    it "returns an error if an invalid api_key is passed in" do      
      body_data = {
        api_key: "badkey",
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }
      
      post "/api/v1/favorites", params: body_data

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:error]).to eq ("Invalid api_key")
    end
  end

  describe "Favorite Index" do
    it "returns an array of favorite recipes for a given user" do
      favorite1 = {
        api_key: @user.api_key,
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Crab Fried Rice (Khaao Pad Bpu)"
      }
      
      post "/api/v1/favorites", params: favorite1
      
      favorite2 = {
        api_key: @user.api_key,
        country: "thailand",
        recipe_link: "https://www.tastingtable.com/.....",
        recipe_title: "Phad Thai"
      }
      
      post "/api/v1/favorites", params: favorite2

      get "/api/v1/favorites?api_key=#{@user.api_key}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data.first).to have_key(:id)
      expect(data.first[:type]).to eq("favorite")

      expect(data).to be_an(Array)

      data.each do |recipe|
        expect(recipe[:attributes][:recipe_title]).to be_a(String)
        expect(recipe[:attributes][:recipe_link]).to be_a(String)
        expect(recipe[:attributes][:country]).to eq("thailand")
        expect(recipe[:attributes][:created_at]).to be_a(String)
      end
    end

    it "returns an error if an invalid api_key is passed in" do      
      get "/api/v1/favorites?api_key=badapikey"

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      data = JSON.parse(response.body, symbolize_names: true)

      expect(data[:error]).to eq ("Invalid api_key")
    end
  end
end