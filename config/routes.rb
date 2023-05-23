Rails.application.routes.draw do

  root "recipes#index"

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'followees', to: "pages#followees", as: :followees
  get 'followers', to: 'pages#followers', as: :followers

  resources :ingredients
  resources :units

  resources :lists do
    resources :recipes, only: [:add, :remove] do
      member do
        post "add", to: "recipes_lists#create"
        delete "remove", to: "recipes_lists#destroy"
      end
    end
    # post "recipes/:recipe_id/add", to: "recipes_lists#create"
    # delete "recipes/:recipe_id/remove", to: "recipes_lists#destroy"
  end

  get 'tagged', to: "recipes#tagged", as: :tagged

  resources :users
  get "profile", to: "users#profile", as: "profile"

  post "users/:id/follow", to: "relationships#create", as: "follow_user"
  delete "users/:id/unfollow", to: "relationships#destroy", as: "unfollow_user"

  get "recipes/:recipe_id/ingredients/new", to: "recipe_ingredients#new", as: :new_recipe_ingredient
  get "recipes/:recipe_id/ingredients/:id/edit", to: "recipe_ingredients#edit", as: :edit_recipe_ingredient
  patch "recipes/:recipe_id/ingredients/:id/", to: "recipe_ingredients#update", as: :update_recipe_ingredient
  # put "recipes/:recipe_id/ingredients/:id/", to: "recipe_ingredients#update", as: :update_recipe_ingredient
  # post "recipes/:recipe_id/ingredients", to: "recipe_ingredients#create", as: :add_recipe_ingredient
  # delete "recipes/:recipe_id/ingredients/:id", to: "recipe_ingredients#destroy", as: :remove_recipe_ingredient

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

    # resources :recipe_ingredients, only: [:new, :edit] do
    #   get "new", to: "recipe_ingredients#new", as: :new_recipe_ingredient
    #   get "edit", to: "recipe_ingredients#edit", as: :edit_recipe_ingredient
    # end

    resources :ingredients, only: [:add, :remove] do
      member do
        post "/", to: "recipe_ingredients#create", as: :add
        delete "/", to: "recipe_ingredients#destroy", as: :remove
      end
    end
  end
end
