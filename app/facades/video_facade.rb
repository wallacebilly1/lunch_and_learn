class VideoFacade
  def video_from(country)
    json = service.video_from(country)
    if json && json[:items].any?
      @video = Video.new(json[:items].first)
    else
      {} 
    end
  end

  private

  def service
    VideoService.new
  end
end