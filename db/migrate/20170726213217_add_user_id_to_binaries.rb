class AddUserIdToBinaries < ActiveRecord::Migration[5.0]
  def change
    add_reference :binaries, :user, foreign_key: true, index: true
  end
end
