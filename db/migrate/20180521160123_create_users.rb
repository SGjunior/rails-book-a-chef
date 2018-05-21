class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.string :email
      t.integer :age
      t.string :photo_url

      t.timestamps
    end
  end
end
