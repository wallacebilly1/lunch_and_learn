class VideoFacade
  def video_from(country)
    json = service.video_from(country)
    @video = Video.new(json[:items].first)
  end

  private

  def service
    VideoService.new
  end
end