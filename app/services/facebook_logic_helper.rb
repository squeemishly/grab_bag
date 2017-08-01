class FacebookLogicHelper
attr_reader :json_output
  def initialize(current_user, year)
    @year = year
    @user = current_user
    @json_output = { "01" => 0,
                    "02" => 0,
                    "03" => 0,
                    "04" => 0,
                    "05" => 0,
                    "06" => 0,
                    "07" => 0,
                    "08" => 0,
                    "09" => 0,
                    "10" => 0,
                    "11" => 0}
  end

  def monthly_breakdown_photos
    photos = MetaDataPhoto.where(user_id: user.id)
    list_by_year = limit_year(photos)
    monthly_ranking_photos(list_by_year)
    json_output
  end

  def monthly_breakdown_comments
    photos = MetaDataPhoto.where(user_id: user.id)
    list_by_year = limit_year(photos)
    monthly_ranking_comments(list_by_year)
    json_output
  end

  private
  attr_reader :user, :year

  def limit_year(photos)
    correct_year = photos.map do |photo|
      if photo.created_time == nil
        photo.created_at.year.to_s == year ? photo : nil
      elsif photo.created_time.split('-')[0] == year
        photo
      end
    end
    correct_year.compact
  end

  def monthly_ranking_comments(list_by_year)
    list_by_year.each do |photo|
      find_comments(photo)
    end
  end

  def find_comments(photo)
    photo_month = photo.created_time.split('-')[1]
    comment_count = FbComment.where(meta_data_photo_id: photo.id).count
    json_output[photo_month] += comment_count
  end

  def monthly_ranking_photos(list_by_year)
    list_by_year.each do |photo|
      photo_month = photo.created_time.split('-')[1]
      json_output[photo_month] += 1
    end
  end

end
