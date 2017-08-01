class FbComment < ApplicationRecord
  belongs_to :meta_data_photo
  belongs_to :user

  def self.most_commenters(user)
    self.group(:fb_uname)
        .where(user_id: user.id)
        .limit(5)
        .order('count_id desc')
        .count('id')
    # info2 = self.find_by_sql ["SELECT fb_comments.fb_uname, COUNT(fb_comments.user_id) FROM fb_comments WHERE fb_comments.user_id = #{user.id} GROUP BY 1 ORDER BY count DESC;"]
  end
end
