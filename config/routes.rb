Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  get 'welcome/index'

  get 'welcome/about'

  resources :users, only: [:show]

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

end
