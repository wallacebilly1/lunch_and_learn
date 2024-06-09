class PhotoService
  def photos_from(country)
    get_url("search/photos/?query=#{country}")
  end

  private
  def get_url(url)
    response = conn.get(url)
    photos = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com/") do |f|
      f.params["client_id"] = Rails.application.credentials.photos[:client_id]
    end
  end
end