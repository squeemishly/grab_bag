class FbTag < ApplicationRecord
  belongs_to :meta_data_photo
  belongs_to :user
end
