Rails.application.routes.draw do
  get 'growths/index'
  devise_for :users
  resources :children do
    resources :growths, only: [:index, :new, :create, :edit, :show, :update, :destroy]
    resources :events
  end
  root to: "home#index"
  resources :users, only: [:edit, :update]
end
