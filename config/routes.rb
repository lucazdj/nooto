Rails.application.routes.draw do

  root 'notes#index'

  get 'home', to: 'pages#home'

  resources :notes
end
