Rails.application.routes.draw do
  root 'pages#hello'

  devise_for :users

  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    post 'toggle', on: :member
  end

  # Your other routes go here
end
