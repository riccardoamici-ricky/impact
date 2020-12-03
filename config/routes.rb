Rails.application.routes.draw do
  resources :follows
  devise_for :users
  root to: 'pages#home'

  resources :karmapoints, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.
  resources :products, only: [:index, :show]
  resources :users, only: :show
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  resources :posts do
    resources :comments
    resources :likes


  end
  resources :events do
    resources :participations, only: [:create, :destroy] do
      post :check_in
    end

    collection do
      get :filter
    end

  end

  get "my_events", to: "events#my_events"
  get "my_participations", to: "participations#my_participations"
  resources :categories, only: [:index, :show]

  get "/dashboard_admin", to: "pages#dashboard_admin"
  get "/profile", to: "pages#profile"
  get "/howwerate", to: "pages#rating"
  get "/buy", to: "products#buy", as: :buy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
