Rails.application.routes.draw do
  root 'pages#hello'

  devise_for :users

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    post 'toggle', on: :member
  end
  resources :shopping_list, only: [:index]
  resources :public_recipes, only: [:index]

  # Your other routes go here
end
