RSpec.configure do
  def stub_oauth
    OmniAuth.config.test_mode = true

    auth_hash = {
      "provider"=>"facebook",
      "uid"=>ENV['facebook_uid'],
      "info"=> {
        "email"=>ENV['facebook_email'],
        "name"=>ENV['facebook_name'],
        "image"=>"http://graph.facebook.com/v2.6/10103559484486366/picture"
      },
      "credentials"=> {
        "token"=> ENV['facebook_token'],
        "expires_at"=>1532637615,
        "expires"=>true
      },
      "extra"=> {
        "raw_info"=> {
          "name"=>ENV['facebook_name'],
          "email"=>ENV['facebook_email'],
          "id"=>ENV['facebook_uid']
        }
      }
    }

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(auth_hash)
  end
end
