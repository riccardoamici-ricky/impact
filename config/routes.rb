Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/show'
  devise_for :users
  root to: 'pages#home'

  resources :karmapoints, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  resources :products, only: [:index]
  resources :posts
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
