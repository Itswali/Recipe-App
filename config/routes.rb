Rails.application.routes.draw do
  
  root 'pages#hello'

  devise_for :users

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end

  post 'recipes/:id/toggle', to: 'recipes#toggle', as: :toggle_recipe

  # Your other routes go here
end
