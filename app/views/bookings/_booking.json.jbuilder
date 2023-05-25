json.extract! booking, :id, :id_user, :id_court, :booked_at, :booked_ends, :booked_for, :total_price, :created_at, :updated_at
json.url booking_url(booking, format: :json)
