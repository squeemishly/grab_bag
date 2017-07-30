class Addextensiontometadatafiles < ActiveRecord::Migration[5.0]
  def change
    add_column :meta_data_files, :extension, :string
  end
end
