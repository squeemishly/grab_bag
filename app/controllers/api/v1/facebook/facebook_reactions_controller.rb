class Api::V1::Facebook::FacebookReactionsController < ApplicationController
  def index
    render json: FbReaction.most_likers(current_user)
  end
end
