class RenameColumnPhotoUrlToPhotoInUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :photo_url, :photo
  end
end
