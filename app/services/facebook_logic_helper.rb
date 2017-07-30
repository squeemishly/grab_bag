class FacebookLogicHelper

  def initialize(current_user, year)
    @year = year
    @user = current_user
  end

  def monthly_breakdown_photos
    photos = MetaDataPhoto.where(user_id: user.id)
    list_by_year = limit_year(photos)
    rank_by_month = monthly_ranking(list_by_year)
  end

  private
  attr_reader :user, :year

  def limit_year(photos)
    correct_year = photos.map do |photo|
      if photo.created_time.split('-')[0] == year
        photo
      end
    end
    correct_year.compact
  end

  def monthly_ranking(list_by_year)
    json_output = { "01" => 0,
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
    list_by_year.each do |photo|
      photo_month = photo.created_time.split('-')[1]
      json_output[photo_month] += 1
    end
    json_output
  end

end
