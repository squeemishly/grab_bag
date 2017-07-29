require 'rails_helper'

RSpec.describe "photo camera meta data records api" do
  context "when the record exists" do
    it "returns the current users photos camera meta data" do
      user = create(:user)
      metadata_1 = MetaDataPhoto.create(height: 1200, width: 850, model: "X100F", shutter_speed: "1/5000", aperture: 19, user_id: user.id)
      metadata_2 = MetaDataPhoto.create(height: 1200, width: 900, model: "X200F", shutter_speed: "1/3000", aperture: 20, user_id: user.id)
      metadata_3 = MetaDataPhoto.create(height: 1500, width: 1200, model: "X300F", shutter_speed: "1/4000", aperture: 17, user_id: user.id)
      metadata_4 = MetaDataPhoto.create(height: 1400, width: 700, model: "X400F", shutter_speed: "1/6000", aperture: 18, user_id: user.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/meta_data/photos/camera_details'

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["height"]).to eq(1200)
      expect(result.first["shutter_speed"]).to eq("1/5000")
      expect(result.first["model"]).to eq("X100F")
      expect(result.last["height"]).to eq(1400)
      expect(result.last["width"]).to eq(700)
    end
  end
end
