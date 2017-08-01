class FbPlace < ApplicationRecord
  has_many :meta_data_photos

  def self.photos_with_a_location
    where.not(lat: nil)
  end

  # def self.photos_by_year
  #   locations = {}
  #   order(created_at: :asc).each do |photo|
  #     if locations["#{photo.created_at.year}"]
  #       locations["#{photo.created_at.year}"] << {"latitude" => photo.lat, "longitude" => photo.long}
  #     else
  #       locations["#{photo.created_at.year}"] = []
  #       locations["#{photo.created_at.year}"] << {"latitude" => photo.lat, "longitude" => photo.long}
  #     end
  #   end
  #   locations
  # end

end