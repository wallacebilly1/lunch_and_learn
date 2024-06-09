require "rails_helper"

RSpec.describe PhotoFacade do
  describe "photos_from" do
    it "returns an array of photos from the queried country", :vcr do
      query = "thailand"
      photos = PhotoFacade.new.photos_from(query)
      
      expect(photos).to be_an(Array)
      expect(photos.count).to eq 10
      photos.each do |photo|
        expect(photo).to be_a(Photo)
        expect(photo.alt_tag).to be_a(String)
        expect(photo.url).to be_a(String)
      end
    end
  end
end