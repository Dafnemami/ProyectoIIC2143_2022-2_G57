class AddFieldsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :bookingstatus, :string
  end
end
