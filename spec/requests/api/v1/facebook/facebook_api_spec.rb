require 'rails_helper'

RSpec.describe "facebook api" do
  it "can display a list of commenters" do
    user = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    mdp = MetaDataPhoto.create(user_id: user.id)
    comment1 = FbComment.create(fb_uname: "squee", user_id: user.id, meta_data_photo_id: mdp.id)
    comment2 = FbComment.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id)
    comment3 = FbComment.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id)
    comment4 = FbComment.create(fb_uname: "Sheila", meta_data_photo_id: mdp.id, user_id: user.id)
    comment5 = FbComment.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id)
    comment6 = FbComment.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id)
    comment7 = FbComment.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id)
    comment8 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id)
    comment9 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id)
    comment10 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id)
    comment11 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id)
    comment12 = FbComment.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user.id)
    comment13 = FbComment.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user2.id)

    get '/api/v1/facebook/facebook_commenters'

    expect(response).to be_success
    info = JSON.parse(response.body)

    expect(info.count).to eq 5
    expect(info["Natalia"]).to eq 4
    expect(info["Elfton"]).to eq 3
    expect(info["Danny"]).to eq 2
    expect(info["Purple"]).to eq 1
    expect(info["Sheila"]).to eq 1
  end
end