class FacebookLogicHelperSerializer < ActiveModel::Serializer

  def attributes(attribute_one, attribute_two)
    object.json_output
  end
end
