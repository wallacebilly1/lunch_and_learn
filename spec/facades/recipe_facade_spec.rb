require "rails_helper"

RSpec.describe RecipeFacade do
  describe "recipes_by_country" do
    it "returns an array of recipes from the queried country", :vcr do
      query = "thailand"
      recipes = RecipeFacade.new.recipes_by_country(query)
      
      expect(recipes).to be_an(Array)

      recipes.each do |recipe|
        expect(recipe).to be_a(Recipe)
        expect(recipe.country).to eq(query)
        expect(recipe.image).to be_a(String)
        expect(recipe.title).to be_a(String)
        expect(recipe.url).to be_a(String)
      end
    end

    it "returns an empty array if a non-country value is queried", :vcr do
      query = "12345"
      recipes = RecipeFacade.new.recipes_by_country(query)

      expect(recipes).to be_an(Array)
      expect(recipes.size).to eq(0)
    end

    it "returns recipes from a random country if an empty value is queried", :vcr do
      query = ""
      recipes = RecipeFacade.new.recipes_by_country(query)

      expect(recipes).to be_an(Array)

      recipes.each do |recipe|
        expect(recipe).to be_a(Recipe)
        expect(recipe.country).to be_a(String)
        expect(recipe.image).to be_a(String)
        expect(recipe.title).to be_a(String)
        expect(recipe.url).to be_a(String)
      end
    end
  end
end