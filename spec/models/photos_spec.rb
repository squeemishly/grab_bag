require 'rails_helper'

RSpec.describe Photos do
  context "class methods" do
    before(:all) do
      @user = create(:user)
      @raw_data = {
      "created_time": "2015-04-20T00:05:03+0000",
      "from": {
        "name": "name",
        "id": "id1"
      },
      "id": "id2",
      "images": [
        {
          "height": 960,
          "source": "imagepath1.com",
          "width": 720
        }
      ],
      "link": "imagepath2.com",
      "place": {
        "name": "Roatán, Honduras",
        "location": {
          "city": "Roatán",
          "country": "Honduras",
          "latitude": 16.3,
          "longitude": -86.55
        },
        "id": "id3"
      },
      "comments": {
        "data": [
          {
            "like_count": 0,
            "comment_count": 0,
            "message": "Heyyy los primos! abrazos",
            "from": {
              "name": "name2",
              "id": "id4"
            },
            "id": "id5"
          },
          {
            "like_count": 0,
            "comment_count": 0,
            "message": "",
            "from": {
              "name": "name1",
              "id": "id1"
            },
            "id": "id6"
          }
        ]
      },
      "tags": {
        "data": [
          {
            "id": "id1",
            "name": "name1"
          }
        ]
      },
      "reactions": {
        "data": [
          {
            "id": "id20",
            "name": "name20",
            "type": "LIKE"
          },
          {
            "id": "id21",
            "name": "name21",
            "type": "LIKE"
          }
        ]
      }
    }
    end

    it ".create_place" do
      expect(FbPlace.count).to eq 0
      place = Photos.create_place(@raw_data)
      expect(FbPlace.count).to eq 1

      expect(place.id).to be_a Integer
      expect(place.fb_place_id).to be_a String
      expect(place.name).to be_a String
      expect(place.city).to be_a String
      expect(place.country).to be_a String
      expect(place.lat).to be_a Float
      expect(place.long).to be_a Float
    end

    it ".create_metadata" do
      expect(MetaDataPhoto.count).to eq 0
      place = Photos.create_place(@raw_data)
      metadata = Photos.create_metadata(@raw_data, place, @user)
      expect(MetaDataPhoto.count).to eq 1

      expect(metadata.id).to be_a Integer
      expect(metadata.user_id).to be_a Integer
      expect(metadata.lat).to be_a Float
      expect(metadata.long).to be_a Float
      expect(metadata.image).to be_a String
      expect(metadata.created_time).to be_a String
      expect(metadata.fb_uname).to be_a String
      expect(metadata.fb_uid).to be_a String
      expect(metadata.fb_photo_id).to be_a String
      expect(metadata.fb_place_id).to be_a Integer
    end

    it ".create_reactions" do
      expect(FbReaction.count).to eq 0
      place = Photos.create_place(@raw_data)
      metadata = Photos.create_metadata(@raw_data, place, @user)
      reaction = Photos.create_reactions(@raw_data, metadata, @user)
      expect(FbReaction.count).to eq 2

      expect(reaction).to be_a Array
      expect(reaction.first.fb_uid).to be_a String
      expect(reaction.first.fb_uname).to be_a String
      expect(reaction.first.reaction_type).to be_a String
    end

    it ".create_comments" do
      expect(FbComment.count).to eq 0
      place = Photos.create_place(@raw_data)
      metadata = Photos.create_metadata(@raw_data, place, @user)
      comment = Photos.create_comments(@raw_data, metadata, @user)
      expect(FbComment.count).to eq 2

      expect(comment).to be_a Array
      expect(comment.first.fb_uid).to be_a String
      expect(comment.first.fb_uname).to be_a String
      expect(comment.first.comment_count).to be_a Integer
      expect(comment.first.like_count).to be_a Integer
      expect(comment.first.message).to be_a String
    end

    it ".create_tags" do
      expect(FbTag.count).to eq 0
      place = Photos.create_place(@raw_data)
      metadata = Photos.create_metadata(@raw_data, place, @user)
      tag = Photos.create_tags(@raw_data, metadata, @user)
      expect(FbTag.count).to eq 1

      expect(tag).to be_a Array
      expect(tag.first.fb_uid).to be_a String
      expect(tag.first.fb_uname).to be_a String
    end
  end
end
