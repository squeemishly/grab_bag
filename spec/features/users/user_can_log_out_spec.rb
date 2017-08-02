require 'rails_helper'
require 'mock_auth_helper'

feature 'log_out' do
  context 'Visitor has an account' do
    it 'And they log in w/ FB' do
      user = create :user, fb_id: "10103559484486366"

      stub_oauth

      visit '/'

      within '.welcome' do
        click_on 'Login with Facebook'
      end

      click_on 'Logout'
      expect(current_path).to eq('/')
      expect(page).to have_link "Login"
    end
  end
end
