Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#index"

  resources :recipes do
    resources :instructions, except: [:index, :show] do
      member do
        put "lift", to: "instructions#lift"
        put "drop", to: "instructions#drop"
      end
    end
  end
end
