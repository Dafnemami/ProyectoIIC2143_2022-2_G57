
class Booking < ApplicationRecord
    validates :booked_for, numericality: { greater_than_or_equal_to: 1 }
end