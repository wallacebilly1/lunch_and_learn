require "rails_helper"

RSpec.describe Recipe do
  before(:each) do
    @photo_attr = {
      "id": "gsllxmVO4HQ",
      "slug": "standing-statue-and-temples-landmark-during-daytime-gsllxmVO4HQ",
      "alternative_slugs": {
          "en": "standing-statue-and-temples-landmark-during-daytime-gsllxmVO4HQ",
          "es": "estatua-de-pie-y-templos-emblematicos-durante-el-dia-gsllxmVO4HQ",
          "ja": "昼間の立像と寺院のランドマーク-gsllxmVO4HQ",
          "fr": "statue-debout-et-points-de-repere-de-temples-pendant-la-journee-gsllxmVO4HQ",
          "it": "statua-in-piedi-e-punto-di-riferimento-dei-templi-durante-il-giorno-gsllxmVO4HQ",
          "ko": "낮에는-동상과-사원의-랜드마크가-세워집니다-gsllxmVO4HQ",
          "de": "stehende-statue-und-wahrzeichen-des-tempels-wahrend-des-tages-gsllxmVO4HQ",
          "pt": "estatua-de-pe-e-marco-dos-templos-durante-o-dia-gsllxmVO4HQ"
      },
      "created_at": "2018-06-05T06:50:34Z",
      "updated_at": "2024-06-08T00:33:00Z",
      "promoted_at": nil,
      "width": 5034,
      "height": 3356,
      "color": "#d9d9d9",
      "blur_hash": "L.IrQxRlnhM}yZWFoeS5R+bcogoy",
      "description": "Traveling on motorbike in norther thailand we came across these amazing sculptural temples and buildings.",
      "alt_description": "standing statue and temples landmark during daytime",
      "breadcrumbs": [],
      "urls": {
          "raw": "https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA&ixlib=rb-4.0.3",
          "full": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=srgb&fm=jpg&ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA&ixlib=rb-4.0.3&q=85",
          "regular": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA&ixlib=rb-4.0.3&q=80&w=1080",
          "small": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA&ixlib=rb-4.0.3&q=80&w=400",
          "thumb": "https://images.unsplash.com/photo-1528181304800-259b08848526?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA&ixlib=rb-4.0.3&q=80&w=200",
          "small_s3": "https://s3.us-west-2.amazonaws.com/images.unsplash.com/small/photo-1528181304800-259b08848526"
      },
      "links": {
          "self": "https://api.unsplash.com/photos/standing-statue-and-temples-landmark-during-daytime-gsllxmVO4HQ",
          "html": "https://unsplash.com/photos/standing-statue-and-temples-landmark-during-daytime-gsllxmVO4HQ",
          "download": "https://unsplash.com/photos/gsllxmVO4HQ/download?ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA",
          "download_location": "https://api.unsplash.com/photos/gsllxmVO4HQ/download?ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA"
      },
      "likes": 310,
      "liked_by_user": false,
      "current_user_collections": [],
      "sponsorship": nil,
      "topic_submissions": {
          "architecture-interior": {
              "status": "rejected"
          },
          "nature": {
              "status": "rejected"
          },
          "spirituality": {
              "status": "rejected"
          }
      },
      "asset_type": "photo",
      "user": {
          "id": "hae8rLbohfw",
          "updated_at": "2024-06-05T01:19:49Z",
          "username": "cadop",
          "name": "Mathew Schwartz",
          "first_name": "Mathew",
          "last_name": "Schwartz",
          "twitter_username": nil,
          "portfolio_url": "http://smart-art.org",
          "bio": "Researcher and designer that likes photography and open source work.  Happy to share my photos and hope people find good use from them.",
          "location": nil,
          "links": {
              "self": "https://api.unsplash.com/users/cadop",
              "html": "https://unsplash.com/@cadop",
              "photos": "https://api.unsplash.com/users/cadop/photos",
              "likes": "https://api.unsplash.com/users/cadop/likes",
              "portfolio": "https://api.unsplash.com/users/cadop/portfolio",
              "following": "https://api.unsplash.com/users/cadop/following",
              "followers": "https://api.unsplash.com/users/cadop/followers"
          },
          "profile_image": {
              "small": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-4.0.3&crop=faces&fit=crop&w=32&h=32",
              "medium": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-4.0.3&crop=faces&fit=crop&w=64&h=64",
              "large": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-4.0.3&crop=faces&fit=crop&w=128&h=128"
          },
          "instagram_username": nil,
          "total_collections": 11,
          "total_likes": 0,
          "total_photos": 413,
          "total_promoted_photos": 77,
          "total_illustrations": 0,
          "total_promoted_illustrations": 0,
          "accepted_tos": true,
          "for_hire": false,
          "social": {
              "instagram_username": nil,
              "portfolio_url": "http://smart-art.org",
              "twitter_username": nil,
              "paypal_email": nil
          }
      },
      "tags": [
          {
              "type": "search",
              "title": "thailand"
          },
          {
              "type": "search",
              "title": "ตำบล ช้างเผือก"
          },
          {
              "type": "search",
              "title": "wiang kum kam"
          }
      ]
  }

    @photo = Photo.new(@photo_attr)
  end

  it "exists" do
    expect(@photo).to be_a Photo
    expect(@photo.alt_tag).to eq("standing statue and temples landmark during daytime")
    expect(@photo.url).to eq("https://images.unsplash.com/photo-1528181304800-259b08848526?ixid=M3w2MjA4MTB8MHwxfHNlYXJjaHwxfHx0aGFpbGFuZHxlbnwwfHx8fDE3MTc5NTgyOTl8MA&ixlib=rb-4.0.3")
  end
end