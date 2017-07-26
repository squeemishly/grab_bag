Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['facebook_key'], ENV['facebook_secret']
  provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET'], scope: 'basic+media+public_content+follower_list+comments+relationships+likes'
end
