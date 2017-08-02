class Api::V1::MetaData::Photos::FilteredByYearController < ApplicationController
  def index
    render json: MetaDataPhoto.filtered_by_year(current_user, params[:year]), each_serializer: FilteredByYearSerializer
  end
end
