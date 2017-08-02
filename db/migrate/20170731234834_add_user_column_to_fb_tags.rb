class AddUserColumnToFbTags < ActiveRecord::Migration[5.0]
  def change
    add_reference :fb_tags, :user, foreign_key: true
  end
end
