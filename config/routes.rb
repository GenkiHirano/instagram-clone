Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:show]
  root 'pages#top'
  get  '/notification', to:'pages#notification'
  get  '/post',         to:'pages#post'
  get  '/my_page',      to:'pages#my_page'
  get  '/sign_up',      to:'registrations#new'
  get  '/sign_in',      to:'sessions#new'
  get "users/show" => "users#show"
end
