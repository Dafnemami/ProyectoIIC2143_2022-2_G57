# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :phone, numericality: { only_integer: true }
  validates :password, confirmation: true
  validates :name, :last_name, format: { with: /\A[a-zA-Z]+\z/ }
  has_many :reviews, dependent: :destroy
end
