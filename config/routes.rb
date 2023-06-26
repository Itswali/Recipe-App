Rails.application.routes.draw do
  devise_for :users

  # Your other routes go here

  root to: 'home#index'
end
