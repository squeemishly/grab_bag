class FacebookPhotoWorker
  include Sidekiq::Worker

  def perform(user)
    Photos.get_data(user)
    find_friends
  end

  def find_friends

  end
end
