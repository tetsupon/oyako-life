Rails.application.routes.draw do
  devise_for :users
  resources :children
  root to: "home#index"
  resources :users, only: [:edit, :update]

end
