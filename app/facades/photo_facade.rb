class PhotoFacade
  def photos_from(country)
    json = service.photos_from(country)
    @photos = json[:results].map { |details| Photo.new(details)}
  end

  private

  def service
    PhotoService.new
  end
end