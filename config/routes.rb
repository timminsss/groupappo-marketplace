Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :product_assignments
  resources :bookings
  resources :products

  get "/products/search", to: "products#search"

  get '/my-products', to: 'products#index_owner'
  get '/my-products/:id', to: 'products#show_owner', as: 'my_product'

end
