Rails.application.routes.draw do
  get 'growths/index'
  devise_for :users
  resources :children do
    resources :growths, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  root to: "home#index"
  resources :users, only: [:edit, :update]
end
