class VideoFacade
  def video_from(country)
    json = service.search(country)
    @video = 
  end

  private

  def service
    VideoService.new
  end
end