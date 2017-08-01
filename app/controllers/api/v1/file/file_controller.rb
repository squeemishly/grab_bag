class Api::V1::File::FileController < ApplicationController

  def topwords_adjectives
    render json: UploadLogicHelper.new(current_user).adjectives
  end

  def topwords_nouns
    render json: UploadLogicHelper.new(current_user).nouns
  end

  def american?
    render json: UploadLogicHelper.new(current_user).american?
  end

  def camera_type
    render json: UploadLogicHelper.new(current_user).camera_types
  end

  def document_types
    render json: UploadLogicHelper.new(current_user).document_types
  end
end
