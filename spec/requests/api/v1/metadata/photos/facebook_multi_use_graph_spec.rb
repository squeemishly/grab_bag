require 'rails_helper'

RSpec.describe "returns multi use dataset for bar and line graph" do
    scenario "gathers photo data by year" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      Photos.get_data(user)
      result = FacebookLogicHelper.new(user, "2014").monthly_breakdown_photos
      expect(result).to be_a Hash
  end

  scenario "gathers comment data by year" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      Photos.get_data(user)
      result = FacebookLogicHelper.new(user, "2014").monthly_breakdown_comments
      expect(result).to be_a Hash
  end

  scenario "API endpoint responds with data for photos" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      Photos.get_data(user)
      get '/api/v1/facebook/photos?year=2014'

      result = JSON.parse(response.body)
      expect(result).to be_a Hash
  end

  scenario "API endpoint responds with data for comments" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      Photos.get_data(user)
      get '/api/v1/facebook/comments?year=2014'

      result = JSON.parse(response.body)
      expect(result).to be_a Hash

  end

  scenario "API endpoint responds with data for both" do
      user = create(:user, fb_id: ENV['my_fb_id'], token: ENV['my_fb_token'])
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      Photos.get_data(user)

      get '/api/v1/facebook/photos_comments?year=2016'

      result = JSON.parse(response.body)
      binding.pry
      expect(result).to be_a Hash

  end
end
