Rails.application.routes.draw do
  root 'pages#home'

  get 'home', to: 'pages#home'

  get 'animals/create', to: 'animals#create'
  get 'animals/read/:id', to: 'animals#read', as: 'animals_read'
  get 'animals/update/:id', to: 'animals#update', as: 'animals_update'
  get 'animals/delete/:id', to: 'animals#delete', as: 'animals_delete'

  resources :animals
end
