Rails.application.routes.draw do
  get 'growths/index'
  devise_for :users

  resources :children do
    resources :growths, only: [:index, :new, :create, :edit, :show, :update, :destroy]
    resources :events
    resources :vaccinations
    resources :healthchecks 
    resources :meals

    # 健康記録管理トップページ
    member do
      get 'health_records', to: 'health_records#top'
    end
  end

  root to: "home#index"

  # 健康管理トップページ
  get 'health_management', to: 'health_management#index'

  resources :users, only: [:edit, :update]
end
