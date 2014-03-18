Sc2mc::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  # resources :contacts, only: [:new, :create]
  # resources :visitors, only: [:new, :create]

 authenticated :user do
  root to: "home#index", as: :authenticated_root
end

unauthenticated do
  root to: "home#welcome"
end

post 'upload' => 'home#upload', as: 'upload'

end
