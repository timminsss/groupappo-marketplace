Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bookings
  resources :products do
    resources :product_assignments, only: [:new, :create]
  end
  resources :product_assignments, only: [:destroy]

  get "/products/search", to: "products#search"

  get '/owner/products', to: 'products#index_owner'
  get '/owner/products/:id', to: 'products#show_owner', as: 'owner_product'
  get '/owner/bookings', to: 'bookings#index_owner'
  get '/products/show/:id', to: 'products#show'
  get '/owner/bookings/:id', to: 'bookings#show_owner', as: 'owner_booking'
  patch '/owner/bookings/:id/confirm', to: 'bookings#confirm', as: 'owner_confirm'
  patch '/owner/bookings/:id/decline', to: 'bookings#decline', as: 'owner_decline'
end
