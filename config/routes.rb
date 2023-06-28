Rails.application.routes.draw do
  
  root 'pages#hello'

  devise_for :users


  resources :foods, only: [:index, :new, :create]
  resources :recipes, only: [:index, :show, :new, :create, :destroy]

  # Your other routes go here
end
