Rails.application.routes.draw do
  root 'pages#top'
  get  'pages/top'
  get  'pages/notification'
  get  'pages/post'
  get  'pages/my_page'
end
