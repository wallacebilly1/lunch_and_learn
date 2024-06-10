require 'rails_helper'

RSpec.describe "Sessions API" do
  describe "Sessions Create" do
    it "returns the user data with a valid api key" do
      user_attr = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      
      User.create(user_attr)

      sessions_attr = {
        email: "goodboy@ruffruff.com",
        password: "treats4lyf"
      }

      post "/api/v1/sessions", params: sessions_attr

      expect(response).to be_successful
      expect(response.status).to eq(200)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:type]).to eq('user')
      expect(data[:attributes][:name]).to eq('Odell')
      expect(data[:attributes][:email]).to eq('goodboy@ruffruff.com')
      expect(data[:attributes]).to have_key(:api_key)
    end

    it "returns an error message if credentials are bad" do
      user_attr = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      
      User.create(user_attr)

      sessions_attr = {
        email: "goodboy@ruffruff.com",
        password: "badpassword"
      }

      post "/api/v1/sessions", params: sessions_attr

      expect(response).to_not be_successful
      expect(response.status).to eq(401)
    end
  end
end