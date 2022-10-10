Rails.application.routes.draw do
  root 'pages#home'

  get 'home', to: 'pages#home'

  get 'animal/create', to: 'animals#create'
  get 'animal/read', to: 'animals#read'
  get 'animal/update', to: 'animals#update'
  get 'animal/delete', to: 'animals#delete'
end
