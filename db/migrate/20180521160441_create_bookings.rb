class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.integer :guests_count
      t.references :listing, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
