Coderheya::Application.routes.draw do
  root :to => 'application#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  get '/tag/:tag' => 'application#index'

  post '/favorites/create'  => 'favorites#create'
  post '/favorites/destroy' => 'favorites#destroy'
  
  match '/users/:nickname(/:tag)' => 'application#index'
  
  resources :links, :only => [:new, :create]
end