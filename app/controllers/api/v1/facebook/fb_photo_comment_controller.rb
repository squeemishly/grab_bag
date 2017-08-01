class Api::V1::Facebook::FbPhotoCommentController < ApplicationController

  def index
    render json: FacebookLogicHelper.new(current_user, params[:year]).joined_photo_comment
  end

end
