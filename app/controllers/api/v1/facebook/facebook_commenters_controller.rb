class Api::V1::Facebook::FacebookCommentersController < ApplicationController
  def index
    render json: FbComment.most_commenters(current_user)
  end
end
