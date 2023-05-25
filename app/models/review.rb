# frozen_string_literal: true

class Review < ApplicationRecord
  validates :content, presence: true
  belongs_to :cancha
  belongs_to :user
end
