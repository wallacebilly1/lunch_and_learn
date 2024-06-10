class GeocodeService
  def lat_and_lon_from(country)
    get_url("v1/geocode/search?country=#{country}")
  end

  private
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.geoapify.com/") do |f|
      f.params["apiKey"] = Rails.application.credentials.geocode[:apiKey]
    end
  end
end