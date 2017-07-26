require 'rails_helper'
require 'mock_auth_helper'

feature 'log_out' do
  context 'Visitor has an account' do
    it 'And they are logged in w/ FB' do
      user = create :user, fb_id: "10103559484486366"

      stub_oauth
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/'
      # within '.welcome' do
        # click_on 'Login with Facebook'
      # end
      # save_and_open_page
      click_on 'Logout'
      expect(current_path).to eq(landing_page_path)
      expect(page).to have_link "Login"

    end

    it 'And they log in w/o FB' do
      user = create :regular_user

      visit '/'
      fill_in 'user[username]', with: user.username
      fill_in 'user[password]', with: 'banana'

      click_on 'Login'

      click_on 'Logout'
      expect(current_path).to eq('/')
      expect(page).to have_link "Login"
    end
  end
end
