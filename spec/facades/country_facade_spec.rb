require "rails_helper"

RSpec.describe RecipeFacade do
  describe "random_country" do
    it "returns an random country", :vcr do
      country = CountryFacade.new.random_country
      
      expect(country).to be_a(Country)

      expect(country.name).to be_a(String)
    end
  end
end