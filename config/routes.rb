Rails.application.routes.draw do
  root 'notes#index'

  get 'home', 'index', to: 'notes#index'

  resources :notes
end
