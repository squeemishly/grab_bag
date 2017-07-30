require 'rails_helper'

describe "api endpoint returns doc types" do
  scenario "returns hash of file types" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    folder = user.home
    binary = create :text_binary, folder: folder
    binary_2 = create :image_binary, folder: folder
    binary_3 = create :unknown_content_type_binary, folder: folder

    metadata_1 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.44441, long: 122.445454, user_id: user.id)
    metadata_2 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.12323, long: 112.451234, user_id: user.id)
    metadata_3 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)

    metadata_4 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Cannon 6D", shutter_speed: "1/500", aperture: 22.2, lat: 12.44441, long: 122.445454, user_id: user.id)
    metadata_5 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Cannon 6D", shutter_speed: "1/500", aperture: 22.2, lat: 12.12323, long: 112.451234, user_id: user.id)
    metadata_6 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)
    metadata_7 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Sony A300", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)

    metadata_8 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Lumia 600", shutter_speed: "1/500", aperture: 22.2, lat: 12.44441, long: 122.445454, user_id: user.id)
    metadata_9 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Sony A300", shutter_speed: "1/500", aperture: 22.2, lat: 12.12323, long: 112.451234, user_id: user.id)
    metadata_10 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)

    metadata_11 = MetaDataFile.create(user_id: user.id, binaries_id: binary.id)
    metadata_12 = MetaDataFile.create(user_id: user.id, binaries_id: binary_2.id)




    get '/api/v1/file/document_types'

    results = JSON.parse(response.body)
  end
end
