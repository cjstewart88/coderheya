Coderheya::Application.routes.draw do
  root :to => 'application#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout' => 'sessions#destroy', :as => :signout
  
  match '/submit' => 'link#create'
end
