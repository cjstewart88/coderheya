Coderheya::Application.routes.draw do
  root :to => 'application#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout

  get '/tag/:name' => 'application#index'

  resources :links, :only => [:new, :create]
end
