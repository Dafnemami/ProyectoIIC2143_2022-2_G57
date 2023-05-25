# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bookings
  get 'users/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :canchas do
    resources :reviews
  end
  resources :users
  root 'main#index'
  get 'main/index', to: 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'mensajes/index'
  get 'mensajes/new'
  post 'mensajes', to: 'mensajes#create'
end
