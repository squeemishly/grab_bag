class FbReaction < ApplicationRecord
  belongs_to :meta_data_photo
  belongs_to :user

  def self.most_likers(user)
    self.group(:fb_uname)
        .where(user_id: user.id)
        .where.not(fb_uid: user.fb_id)
        .limit(5)
        .order('count_id desc')
        .count('id')
  end
end
