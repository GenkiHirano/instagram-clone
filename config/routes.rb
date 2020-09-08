Rails.application.routes.draw do
  root 'pages#top'
  #get  '/users/password/edit',       to:'users/passwords#edit'

  #devise_scope :user do
    #get '/users/password/edit', to: 'users/passwords#edit'
  #end

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks',
  passwords: 'users/passwords'}
  resources :users,       only: [:show, :edit, :update, :index, :destroy]
  resources :microposts,  only: [:create, :destroy]
  get  '/notification',       to:'pages#notification'
  get  '/post',               to:'pages#post'
end
