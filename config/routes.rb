Rails.application.routes.draw do
  #root to: "home#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show]
  root 'pages#top'
  get  '/notification', to:'pages#notification'
  get  '/post',         to:'pages#post'
  get  '/my_page',      to:'pages#my_page'
  get  '/sign_up',      to:'registrations#new'
end
