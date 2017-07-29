require 'rails_helper'

RSpec.describe "Consume user photos" do
  it "get meta data from their photos" do
    user = create(:user, fb_id: ENV['fb_test_uid'], token: ENV['fb_test_token'])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/photos'

    expect(page).to have_content("6 facebook photos")
  end
end
