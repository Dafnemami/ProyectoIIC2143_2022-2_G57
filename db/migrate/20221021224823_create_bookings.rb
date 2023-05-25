class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :id_user
      t.references :id_court
      t.timestamp :booked_at
      t.timestamp :booked_ends
      t.integer :booked_for
      t.integer :total_price

      t.timestamps
    end
  end
end
