require 'rails_helper'

RSpec.describe FacebookPhotoWorker do
  it "pulls the metadata from facebook photos" do
    Sidekiq::Testing.inline! do
      raw_photo_data = {}

      expect(FbComment.count).to eq 0
      expect(FbPlace.count).to eq 0
      expect(FbReaction.count).to eq 0
      expect(FbTag.count).to eq 0

      FacebookPhotoWorker.perform_async(user.id)
      binding.pry

      expect(FbComment.count).to eq 0
      expect(FbPlace.count).to eq 0
      expect(FbReaction.count).to eq 0
      expect(FbTag.count).to eq 0
    end
  end
end
