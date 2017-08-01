class FbPlaceSerializer < ActiveModel::Serializer
  attributes :latitude, :longitude, :type, :color, :zoomLevel

  def latitude
    object.lat
  end

  def longitude
    object.long
  end

  def type
    "circle"
  end

  def color
    "#6c00ff"
  end

  def zoomLevel
    5
  end
end
