# class RecipeFacade
#   def recipes_by_country(country)
#     json = RecipeService.new
#     require 'pry'; binding.pry
    
#     json.search(country)

#     @recipes = json[:hits].map { |details| Recipe.new(details, country) }
#   end
# end

class RecipeFacade
  def recipes_by_country(country)
    json = service.search(country)
    @recipes = json[:hits].map { |details| Recipe.new(details, country) }
  end

  private

  def service
    RecipeService.new
  end
end