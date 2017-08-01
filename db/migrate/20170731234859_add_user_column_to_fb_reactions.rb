class AddUserColumnToFbReactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :fb_reactions, :user, foreign_key: true
  end
end
