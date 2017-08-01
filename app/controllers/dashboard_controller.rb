class DashboardController < ApplicationController
  def index
    gon.photo_values = FacebookLogicHelper.new(current_user, "2016").monthly_breakdown_photos.values
    gon.comment_values = FacebookLogicHelper.new(current_user, "2016").monthly_breakdown_comments.values
  end
end
