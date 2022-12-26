Rails.application.routes.draw do
  resources :relationships
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#index"

  post "users/:id/follow", to: "relationship#create", as: "follow_user"
  put "users/:id/unfollow", to: "relationship#destroy", as: "unfollow_user"

  resources :recipes do
    resources :instructions, except: [:index, :show] do
      member do
        put "lift", to: "instructions#lift"
        put "drop", to: "instructions#drop"
      end
    end
  end
end
