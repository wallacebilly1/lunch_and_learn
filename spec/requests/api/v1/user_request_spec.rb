require 'rails_helper'

RSpec.describe "User Registration" do
  describe "User Create" do
    it "can create a user with valid attributes", :vcr do
      body_data = {
        name: "Odell",
        email: "goodboy@ruffruff.com",
        password: "treats4lyf",
        password_confirmation: "treats4lyf"
      }
      
      post "/api/v1/users", params: body_data

      expect(response).to be_successful
      expect(response.status).to eq(201)

      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:attributes][:name]).to eq('Odell')
      expect(data[:attributes][:email]).to eq('goodboy@ruffruff.com')
      expect(data[:attributes]).to have_key(:api_key)
    end
  end
end