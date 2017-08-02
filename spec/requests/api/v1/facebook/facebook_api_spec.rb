require 'rails_helper'

RSpec.describe "facebook api" do
  it "can display a list of commenters" do
    user = create(:user, fb_id: 7)
    user2 = create(:user, fb_id: 10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    mdp = MetaDataPhoto.create(user_id: user.id)
    comment1 = FbComment.create(fb_uname: "squee", user_id: user.id, meta_data_photo_id: mdp.id, fb_uid: 6)
    comment2 = FbComment.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 5)
    comment3 = FbComment.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 5)
    comment4 = FbComment.create(fb_uname: "Sheila", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 4)
    comment5 = FbComment.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    comment6 = FbComment.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    comment7 = FbComment.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    comment8 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    comment9 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    comment10 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    comment11 = FbComment.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    comment12 = FbComment.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 1)
    comment13 = FbComment.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user2.id, fb_uid: 1)

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

  it "can display a list of taggers" do
    user = create(:user, fb_id: 7)
    user2 = create(:user, fb_id: 10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    mdp = MetaDataPhoto.create(user_id: user.id)
    tag1 = FbTag.create(fb_uname: "squee", user_id: user.id, meta_data_photo_id: mdp.id, fb_uid: 6)
    tag2 = FbTag.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 5)
    tag3 = FbTag.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 5)
    tag4 = FbTag.create(fb_uname: "Sheila", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 4)
    tag5 = FbTag.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    tag6 = FbTag.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    tag7 = FbTag.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    tag8 = FbTag.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    tag9 = FbTag.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    tag10 = FbTag.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    tag11 = FbTag.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    tag12 = FbTag.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 1)
    tag13 = FbTag.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user2.id, fb_uid: 1)

    get '/api/v1/facebook/facebook_taggers'

    expect(response).to be_success
    info = JSON.parse(response.body)

    expect(info.count).to eq 5
    expect(info["Natalia"]).to eq 4
    expect(info["Elfton"]).to eq 3
    expect(info["Danny"]).to eq 2
    expect(info["Purple"]).to eq 1
    expect(info["Sheila"]).to eq 1
  end

  it "can display a list of likers" do
    user = create(:user, fb_id: 7)
    user2 = create(:user, fb_id: 10)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    mdp = MetaDataPhoto.create(user_id: user.id)
    reaction1 = FbReaction.create(fb_uname: "squee", user_id: user.id, meta_data_photo_id: mdp.id, fb_uid: 6)
    reaction2 = FbReaction.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 5)
    reaction3 = FbReaction.create(fb_uname: "Danny", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 5)
    reaction4 = FbReaction.create(fb_uname: "Sheila", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 4)
    reaction5 = FbReaction.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    reaction6 = FbReaction.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    reaction7 = FbReaction.create(fb_uname: "Elfton", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 3)
    reaction8 = FbReaction.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    reaction9 = FbReaction.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    reaction10 = FbReaction.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    reaction11 = FbReaction.create(fb_uname: "Natalia", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 2)
    reaction12 = FbReaction.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user.id, fb_uid: 1)
    reaction13 = FbReaction.create(fb_uname: "Purple", meta_data_photo_id: mdp.id, user_id: user2.id, fb_uid: 1)

    get '/api/v1/facebook/facebook_reactions'

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
