class Api::V1::Facebook::FbPhotoController < ApplicationController

  def index
    render json: FacebookLogicHelper.new(current_user, params[:year]).monthly_breakdown_photos
  end

end
