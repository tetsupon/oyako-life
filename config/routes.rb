Rails.application.routes.draw do
  devise_for :users
  root to: "childrens#index"
  resources :users, only: [:edit, :update]

end
