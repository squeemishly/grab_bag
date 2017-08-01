class DashboardController < ApplicationController
  def index
    @commonwealth = UploadLogicHelper.new(current_user).american?
  end
end
