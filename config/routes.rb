Sc2mc::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # resources :contacts, only: [:new, :create]
  # resources :visitors, only: [:new, :create]
  root to: 'home#index'
end
