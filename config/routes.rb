Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'top_pages#top'

  get 'guest_login', to: 'sessions#guest_login'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'privacy_policy', to: 'homes#privacy_policy'
  get 'terms', to: 'homes#terms'
  get 'sitemap', to: redirect("https://s3-ap-northeast-1.amazonaws.com/enkyori-enmusubi/sitemaps/sitemap.xml.gz")

  resources :users, only: %i[new create]
  resources :dashboards, only: %i[index]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end
  resources :meets
  resources :distances, only: %i[index show]
  resources :relationships, only: %i[new create]
  resources :rewards, only: %i[new create show edit update]
  resources :efforts, only: %i[new create edit update]
  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update]
  resource :invite, only: %i[show edit update]

  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
  end
end