class MetaDataPhoto < ApplicationRecord
  has_many :fb_comments
  has_many :fb_tags
  has_many :fb_reactions
  has_one :fb_place
  belongs_to :user

  def self.photos_with_a_location(user)
    where(user_id: user.id).where.not(lat: nil)
  end

  def self.filtered_by_year(user, year)
    where(user_id: user.id).where("created_time LIKE (?)", "#{year}%").where.not(lat: 'null').order(:id)
  end
end
