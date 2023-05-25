# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :request do
  before(:all) do
    @booking = create(:booking)
    @booking.save
  end

  describe 'crear reserva' do
    it 'si tiene atributos validos' do
      expect do
        post bookings_path, params: {
          booking: {
            id_user_id: @booking.id_user_id,
            id_court_id: @booking.id_court_id,
            booked_at: @booking.booked_at,
            booked_ends: @booking.booked_ends,
            booked_for: @booking.booked_for,
            total_price: @booking.total_price
          }
        }
      end.to change(Booking, :count).by(1)
    end
  end

  describe 'editar reserva' do
    it 'si tiene atributos validos' do
      patch booking_path(@booking), params: {
        booking: {
          id_user_id: @booking.id_user_id,
          id_court_id: @booking.id_court_id,
          booked_at: @booking.booked_at,
          booked_ends: @booking.booked_ends,
          booked_for: @booking.booked_for,
          total_price: '10'
        }
      }
      expect(Booking.find(@booking.id).total_price).to eq(10)
    end
  end

  describe 'eliminar reserva' do
    it 'si tiene atributos validos' do
      expect do
        delete booking_path(@booking)
      end.to change(Booking, :count).by(-1)
    end
  end
end
