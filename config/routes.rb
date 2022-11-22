Rails.application.routes.draw do
  # get 'bookings/new', to: 'bookings#new'
  # post 'bookings', to: 'bookings#create'
  # get 'bookings/:id', to: 'bookings#show', as: 'booking'
  # get 'bookings/destroy'
  # get 'bookings/edit'
  # get 'bookings/update'

  devise_for :users
  root to: "pages#home"

  resources :product_assignments
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
