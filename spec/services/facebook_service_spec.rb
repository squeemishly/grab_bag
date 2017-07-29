require 'rails_helper'

RSpec.describe "FacebookService" do
  context "class methods" do
    it ".get_data(user)" do
      user = create(:user, fb_id: ENV['fb_test_uid'], token: ENV['fb_test_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      photos_data = FacebookService.get_data(user)
      first_photo = photos_data.first

      expect(photos_data).to be_an Array
      expect(first_photo).to have_key(:created_time)
      expect(first_photo[:created_time]).to be_a String
    end
  end
end
