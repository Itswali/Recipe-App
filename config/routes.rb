Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :public_recipes, only: [:index]
  
  post 'recipes/:id/toggle', to: 'recipes#toggle', as: :toggle_recipe

  get '/shopping_lists', to: 'shopping_lists#index'

  resources :users do
    resources :foods, only: [:index, :show, :new, :create, :destroy]
  end
  # Defines the root path route ("/")
  root "recipes#index"
end