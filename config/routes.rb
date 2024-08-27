Rails.application.routes.draw do
  get 'growths/index'
  devise_for :users
  resources :children do
    resources :growths, only: [:index, :new, :create, :edit, :show, :update, :destroy]
    resources :events
    resources :vaccinations
    resources :healthchecks 
  end
  root to: "home#index"
    # 健康管理トップページ
  get 'health_management', to: 'health_management#index'
  resources :users, only: [:edit, :update]
end
