Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  resources :users, only: [:show]

  resources :registered_applications


end
