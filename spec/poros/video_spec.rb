require "rails_helper"

RSpec.describe Video do
  before(:each) do
    @video_attr = {
      "kind": "youtube#searchResult",
      "etag": "i3KYJwcYHFBA8LaOshvDBM-zOHk",
      "id": {
          "kind": "youtube#video",
          "videoId": "2MhGlgCptko"
      },
      "snippet": {
          "publishedAt": "2024-06-03T06:10:40Z",
          "channelId": "UCluQ5yInbeAkkeCndNnUhpw",
          "title": "A Super Quick History of Thailand",
          "description": "thailand #history Pictures attribution: https://pastebin.com/X0P99ntk.",
          "thumbnails": {
              "default": {
                  "url": "https://i.ytimg.com/vi/2MhGlgCptko/default.jpg",
                  "width": 120,
                  "height": 90
              },
              "medium": {
                  "url": "https://i.ytimg.com/vi/2MhGlgCptko/mqdefault.jpg",
                  "width": 320,
                  "height": 180
              },
              "high": {
                  "url": "https://i.ytimg.com/vi/2MhGlgCptko/hqdefault.jpg",
                  "width": 480,
                  "height": 360
              }
          },
          "channelTitle": "Mr History",
          "liveBroadcastContent": "none",
          "publishTime": "2024-06-03T06:10:40Z"
      }
  }

    @video = Video.new(@video_attr)
  end

  it "exists" do
    expect(@video).to be_a Video
    expect(@video.title).to eq("A Super Quick History of Thailand")
    expect(@video.youtube_video_id).to eq("2MhGlgCptko")
  end
end