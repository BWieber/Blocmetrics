Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'

  get 'about' => 'welcome#about'

  get 'brandon' => 'welcome#brandon'

  get 'code' => 'welcome#code'

  get 'welcome/index'

  get 'welcome/about' => 'about'

  resources :users, only: [:show]

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create, :new]
  end

end
