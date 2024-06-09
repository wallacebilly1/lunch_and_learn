class PhotoSerializer
  include JSONAPI::Serializer

  attributes :alt_tag, :url
end
