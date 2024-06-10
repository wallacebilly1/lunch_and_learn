require 'rails_helper'

RSpec.describe "Favorites API" do
  describe "Favorite Create" do
    it "can create a favorite" do
      user_attr = {
        name: "Odell",
        email: "goodboy@ruffruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      
      user = User.create(user_attr)

      user.reload
      
      body_data = {
        api_key: user.api_key,
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
      user_attr = {
        name: "Odell",
        email: "goodboy@ruffruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      
      user = User.create(user_attr)

      user.reload
      
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
end