class PlaceService
  def tourist_sites_from(lat, lon)
    get_url("v2/places?filter=circle:#{lon},#{lat},5000")
  end

  private
  def get_url(url)
    response = conn.get(url)
    photos = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.geoapify.com/") do |f|
      f.params["apiKey"] = Rails.application.credentials.geocode[:apiKey]
      f.params["categories"] = "tourism"
    end
  end
end