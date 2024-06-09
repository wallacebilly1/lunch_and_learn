class RecipeService
  def search(query)
    get_url("api/recipes/v2?q=#{query}")
  end

  private
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.edamam.com/") do |f|
      f.params["app_id"] = Rails.application.credentials.recipes[:app_id]
      f.params["app_key"] = Rails.application.credentials.recipes[:app_key]
      f.params["type"] = "public"
    end
  end
end