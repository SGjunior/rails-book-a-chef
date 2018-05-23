class RenameColumnsInListings < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :lat, :latitude
    rename_column :listings, :lng, :longitude
    add_column :listings, :address, :string
  end
end
