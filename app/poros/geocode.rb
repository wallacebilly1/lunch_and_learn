class Geocode
  attr_reader :lat, :lon

  def initialize(data)
    @lat = data[:properties][:lat]
    @lon = data[:properties][:lon]
  end
end
