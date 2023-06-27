Rails.application.routes.draw do
  root 'pages#hello'

  devise_for :users

  resources :foods, only: [:index, :new, :create]
  # Your other routes go here
end
