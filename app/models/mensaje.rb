class Mensaje < ApplicationRecord
    validates :receptor, :cuerpo, presence: true
end
