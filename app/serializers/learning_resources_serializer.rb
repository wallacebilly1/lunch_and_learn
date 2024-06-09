class LearningResourcesSerializer
  include JSONAPI::Serializer

  set_type :learning_resource

  set_id { |object| object[:id] }

  attribute :country do |object|
    object[:country]
  end

  attribute :video do |object|
    video = object[:video]
    {
      title: video.title,
      youtube_video_id: video.youtube_video_id
    }
  end

  attribute :images do |object|
    object[:photos].map do |photo|
      {
        alt_tag: photo.alt_tag,
        url: photo.url
      }
    end
  end
end
