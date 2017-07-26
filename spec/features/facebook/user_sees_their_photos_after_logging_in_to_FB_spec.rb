require 'rails_helper'
require 'mock_auth_helper'

RSpec.describe "a user can see their photos" do
  context "after they login" do
    it "returns an album with their photos" do
      create(:user, fb_id: ENV['facebook_uid'])
      stub_oauth

      visit '/'

      click_on "Albums"
      expect(current_path).to be "/albums"

      click_on "Facebook Album"
      expect(current_path).to be "/albums/facebook"

      expect(page).to have_selector ".photo", count: 6
      within first(".photo") do
        expect(page).to have_xpath "//image[@src=#{Binary.first.data_url}]"
      end
    end
  end
end
