class Api::V1::Facebook::FacebookTaggersController < ApplicationController
  def index
    render json: FbTag.most_taggers(current_user)
  end
end
