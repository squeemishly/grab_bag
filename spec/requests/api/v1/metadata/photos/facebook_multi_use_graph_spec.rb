require 'rails_helper'

RSpec.describe "returns multi use dataset for bar and line graph" do
    scenario "gathers correct user data" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      stuff = Photos.get_data(user)
      binding.pry
  end
end
