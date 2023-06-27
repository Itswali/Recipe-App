Rails.application.routes.draw do
  root 'pages#hello'

  devise_for :users

  # Your other routes go here
end
