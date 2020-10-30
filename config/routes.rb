Rails.application.routes.draw do
  resources :restaurants
  resources :shops

  # Custom Endpoints
  get 'restaurant/random', to: 'restaurants#random'
  get 'restaurant/search', to: 'restaurants#search'

  get 'shop/random', to: 'shops#random'
  get 'shop/search', to: 'shops#search'
end
