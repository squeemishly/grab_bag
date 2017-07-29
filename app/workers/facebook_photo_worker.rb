class FacebookPhotoWorker
  include Sidekiq::Worker

  def perform(user_id)
    binding.pry
    user = User.find(user_id)
    Photos.get_data(user)
    # find_friends
  end

  # def find_friends
  #
  # end
end
