require 'rails_helper'

RSpec.describe "returns multi use dataset for bar and line graph" do
    scenario "gathers photo data by year" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      Photos.get_data(user)
      result = FacebookLogicHelper.new(user, "2014").monthly_breakdown_photos
      expect(result).to be_a Hash
  end

  scencario "gathers comment data by year" do
    
  end
end
