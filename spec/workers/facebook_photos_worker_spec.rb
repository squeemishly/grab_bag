require 'rails_helper'

RSpec.describe FacebookPhotoWorker do
  it "pulls the metadata from facebook photos" do
    Sidekiq::Testing.inline! do
      user = create(:user,
                    fb_id: ENV['fb_test_uid'],
                    token: ENV['fb_test_token']
                    )

      expect(FbComment.count).to eq 0
      expect(FbPlace.count).to eq 0
      expect(FbReaction.count).to eq 0
      expect(FbTag.count).to eq 0

      FacebookPhotoWorker.perform_async(user.id)

      expect(FbComment.count).to eq 0
      expect(FbPlace.count).to eq 2
      expect(FbReaction.count).to eq 0
      expect(FbTag.count).to eq 6
    end
  end
end
