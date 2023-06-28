Rails.application.routes.draw do
  devise_for :users

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy, :edit, :update]
  end

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :public_recipes, only: [:index]

  post 'recipes/:id/toggle', to: 'recipes#toggle', as: :toggle_recipe

  get '/shopping_list', to: 'shopping_list#index'

  resources :foods, only: [:index, :new, :create]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  # Your other routes go here
  root 'recipes#index'
end
