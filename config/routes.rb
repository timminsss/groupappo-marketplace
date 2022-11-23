Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bookings
  resources :products do
    resources :product_assignments, only: [:new, :create]
  end
  resources :product_assignments, only: [:destroy]

  get "/products/search", to: "products#search"

  get '/my-products', to: 'products#index_owner'
  get '/my-products/:id', to: 'products#show_owner', as: 'my_product'
  get '/products/show/:id', to: 'products#show'

end
