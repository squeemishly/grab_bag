class Api::V1::Facebook::FbPhotoController < ActionController::API

  def index
    render json: FacebookLogicHelper.new(current_user, params[:year])
  end

end
