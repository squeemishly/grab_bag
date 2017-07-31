require 'rails_helper'

describe "api endpoint returns camaera types and model" do
  scenario "returns hash of model types" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    metadata_1 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.44441, long: 122.445454, user_id: user.id)
    metadata_2 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.12323, long: 112.451234, user_id: user.id)
    metadata_3 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)

    metadata_1 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Cannon 6D", shutter_speed: "1/500", aperture: 22.2, lat: 12.44441, long: 122.445454, user_id: user.id)
    metadata_2 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Cannon 6D", shutter_speed: "1/500", aperture: 22.2, lat: 12.12323, long: 112.451234, user_id: user.id)
    metadata_3 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)
    metadata_3 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Sony A300", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)

    metadata_1 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Lumia 600", shutter_speed: "1/500", aperture: 22.2, lat: 12.44441, long: 122.445454, user_id: user.id)
    metadata_2 = MetaDataPhoto.create(width: 1400, height: 1000, model: "Sony A300", shutter_speed: "1/500", aperture: 22.2, lat: 12.12323, long: 112.451234, user_id: user.id)
    metadata_3 = MetaDataPhoto.create(width: 1400, height: 1000, model: "X100F", shutter_speed: "1/500", aperture: 22.2, lat: 12.65751, long: 132.445454, user_id: user.id)

    get '/api/v1/file/camera_type/'

    result_models = JSON.parse(response.body)

    expect(result_models["Lumia 600"]).to eq(1)
    expect(result_models["X100F"]).to eq(5)
    expect(result_models["Cannon 6D"]).to eq(2)
  end
end
