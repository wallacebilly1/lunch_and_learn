class VideoService
  def video_from(country)
    get_url("youtube/v3/search?q=#{country}")
  end

  private
  def get_url(url)
    response = mr_history_conn.get(url)
    photos = JSON.parse(response.body, symbolize_names: true)
  end

  def mr_history_conn
    Faraday.new(url: "https://youtube.googleapis.com/") do |f|
      f.params["key"] = Rails.application.credentials.videos[:key]
      f.params["channelId"] = "UCluQ5yInbeAkkeCndNnUhpw"
      f.params["maxResults"] = 1
      f.params["part"] = "snippet"
    end
  end
end