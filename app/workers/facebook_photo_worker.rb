class FacebookPhotoWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    Photos.get_data(user)
  end
end
