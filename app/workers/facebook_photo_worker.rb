class FacebookPhotoWorker
  include Sidekiq::Worker

<<<<<<< HEAD
  def perform(user_id)
    user = User.find(user_id)
    Photos.get_data(user)
    # find_friends
  end

  # def find_friends
  #
  # end
=======
  def perform(user)
    Photos.get_data(user)
    find_friends
  end

  def find_friends

  end
>>>>>>> 3c3707829207ae928fbcebc5dfbe9c56a28fa8d1
end
