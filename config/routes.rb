Rails.application.routes.draw do
  root 'pages#top'
  get  '/notification', to:'pages#notification'
  get  '/post',         to:'pages#post'
  get  '/my_page',      to:'pages#my_page'
end
