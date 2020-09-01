Rails.application.routes.draw do
  root 'pages#top'
  #get  'users/password/edit',     to:'devise/passwords#edit'
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, :only => [:show, :edit, :update, :index]
  #resources :passwords, :only => [:new, :create, :edit, :update]
  get  '/notification', to:'pages#notification'
  get  '/post',         to:'pages#post'
end
