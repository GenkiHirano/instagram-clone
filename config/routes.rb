Rails.application.routes.draw do
  root 'pages#top'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show, :edit, :update]
  get  '/notification', to:'pages#notification'
  get  '/post',         to:'pages#post'
end
