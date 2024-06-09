class Photo
  attr_reader :alt_tag,
              :url

  def initialize(data)
    @alt_tag  = data[:alt_description]
    @url      = data[:urls][:raw]
  end
end
