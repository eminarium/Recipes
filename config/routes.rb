Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'followees', to: "pages#followees", as: :followees
  get 'followers', to: 'pages#followers', as: :followers

  resources :users
  get "profile", to: "users#profile", as: "profile"
  root "recipes#index"

  post "users/:id/follow", to: "relationships#create", as: "follow_user"
  delete "users/:id/unfollow", to: "relationships#destroy", as: "unfollow_user"

  resources :recipes do
    # get 'shared', to: "recipes#shared", on: :collection

    member do
      post "like", to: "likes#create"
      delete "unlike", to: "likes#destroy"

      post "mark_cooked", to: "cookings#create"
      delete "unmark_cooked", to: "cookings#destroy"
    end

    resources :instructions, except: [:index, :show] do
      member do
        put "lift", to: "instructions#lift"
        put "drop", to: "instructions#drop"
      end
    end
  end
end
