# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :admin_user do
    
  end

  factory :mensaje do
    emisor { "" }
    receptor { "" }
    cuerpo { "MyText" }
  end
  
  factory :booking do
    id_user_id { '1' }
    id_court_id { '1' }
    booked_at { '2022-10-21 19:48:23' }
    booked_ends { '2022-10-21 19:48:23' }
    booked_for { 1 }
    total_price { 1 }
  end

  factory :review do
    content { 'MyText' }
    cancha_id { '1' }
    user_id { '1' }
  end

  factory :cancha do
    nombre { 'Cancha 1' }
    deporte { 'Futbol' }
    estado { 'Disponible' }
    id_arrendatario { '1' }
  end

  factory :user do
    email { 'asqasdsdf@uc.clo' }
    password { '123456' }
    password_confirmation { '123456' }
    admin { false }
    moderator { false }
    name { 'Juan' }
    last_name { 'Perez' }
    run { '12345678-9' }
    phone { '123456789' }
    address { 'Av. Siempre Viva 123' }
    birth_date { '1990-01-01' }
    pay_method { 'Efectivo' }
  end
end
