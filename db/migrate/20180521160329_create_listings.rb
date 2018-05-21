class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :max_party_size
      t.integer :min_party_size
      t.integer :price_per_person
      t.string :cuisine
      t.text :description
      t.float :lng
      t.float :lat
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
