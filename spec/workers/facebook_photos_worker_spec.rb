require 'rails_helper'

RSpec.describe FacebookPhotoWorker do
  it "pulls the metadata from facebook photos" do
    Sidekiq::Testing.inline! do
      user = create(:user, fb_id: "107106676601926")

      expect(FbComment.count).to eq 0
      expect(FbPlace.count).to eq 0
      expect(FbReaction.count).to eq 0
      expect(FbTag.count).to eq 0

      FacebookPhotoWorker.perform_async(user.id)
      binding.pry

      expect(FbComment.count).to eq 100
      expect(FbPlace.count).to eq 1
      expect(FbReaction.count).to eq 362
      expect(FbTag.count).to eq 5
    end
  end
end
