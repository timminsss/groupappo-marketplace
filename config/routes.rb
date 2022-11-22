Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/my-products', to: 'products#index_owner'
  get '/my-products/:id', to: 'products#show_owner', as: 'my_product'
  get 'products/new', to: 'products#new'
  post 'products', to: 'products#create'
end
