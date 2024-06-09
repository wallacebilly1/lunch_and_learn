class VideoSerializer
  include JSONAPI::Serializer

  attributes :title, :youtube_video_id
end