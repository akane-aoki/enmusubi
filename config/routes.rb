Rails.application.routes.draw do
  root 'top_pages#top'
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

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'guest_login', to: 'sessions#guest_login'
  get 'privacy_policy', to: 'homes#privacy_policy'
  get 'terms', to: 'homes#terms'
end