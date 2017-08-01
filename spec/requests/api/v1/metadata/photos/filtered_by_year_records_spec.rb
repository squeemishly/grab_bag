require 'rails_helper'

RSpec.describe "photo location meta data filtered by year record api" do
  context "when the record exists" do
    it "returns the current users photos location meta data filtered by year" do
      user = create(:user)
      metadata_1 = MetaDataPhoto.create(lat: 12.44441, long: 122.445454, user_id: user.id, created_time: '2017')
      metadata_2 = MetaDataPhoto.create(lat: 12.12323, long: 112.451234, user_id: user.id, created_time: '2017')
      metadata_3 = MetaDataPhoto.create(lat: 12.65751, long: 132.445454, user_id: user.id, created_time: '2017')

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      get '/api/v1/meta_data/photos/filtered_by_year?year=2017'

      result = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(result.first["latitude"]).to eq(metadata_1.lat)
      expect(result.first["longitude"]).to eq(metadata_1.long)
      expect(result.last["latitude"]).to eq(metadata_3.lat)
      expect(result.last["longitude"]).to eq(metadata_3.long)
    end
  end
end
