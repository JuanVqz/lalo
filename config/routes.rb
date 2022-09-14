Rails.application.routes.draw do
  resources :orders
  resources :items

  root "orders#index"
end
