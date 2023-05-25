# frozen_string_literal: true

class Cancha < ApplicationRecord
  validates :nombre, :deporte, :estado, presence: true
  has_many :reviews, dependent: :destroy
end
