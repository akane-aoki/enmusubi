Rails.application.routes.draw do
  get 'efforts/new'
  get 'efforts/edit'
  get 'efforts/index'
  root 'static_pages#top'
  resources :users, only: %i[new create]
  resources :dashboards, only: %i[index]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
  end
  resources :meets
  resources :distances
  resources :relationships
  resources :rewards
  resources :password_resets, only: %i[new create edit update]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
end