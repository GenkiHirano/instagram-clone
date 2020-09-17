Rails.application.routes.draw do
  root 'pages#top'
  get 'search', to: 'microposts#search', as: :search
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks',
  passwords: 'users/passwords'}
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,    only: [:create, :destroy]
  resources :users,         only: [:show, :index, :destroy]
  resources :relationships, only: [:create, :destroy]
  get  '/notification',       to:'pages#notification'
  get  '/post',               to:'pages#post'
end
