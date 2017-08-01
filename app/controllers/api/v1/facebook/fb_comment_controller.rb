class Api::V1::Facebook::FbCommentController < ApplicationController

  def index
    render json: FacebookLogicHelper.new(current_user, params[:year]).monthly_breakdown_comments
  end

end
