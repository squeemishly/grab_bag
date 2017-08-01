class AddUserColumnToFbComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :fb_comments, :user, foreign_key: true
  end
end
