require "rails_helper"

RSpec.describe VideoFacade do
  describe "video_from" do
    it "returns a video from the queried country", :vcr do
      query = "thailand"
      video = VideoFacade.new.video_from(query)
      
      expect(video).to be_a(Video)
      expect(video.title).to be_a(String)
      expect(video.youtube_video_id).to be_a(String)
    end
  end
end