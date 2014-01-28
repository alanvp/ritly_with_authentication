Ritly::Application.routes.draw do
  
  resources :users, :sessions

  root to: 'ritly#index'

  get '/go/:random_string/preview', to: 'ritly#preview', as: :preview

  get '/go/:random_string', to: 'ritly#go', as: :go

  get '/ritly/:id/show', to: 'ritly#show', as: :show

  post '/ritly', to: 'ritly#create', as: :create 


  get '/signup' => 'users#new'
  
  match '/signout', to: 'sessions#destroy', via: :delete
  
  get'/signin' => 'sessions#new'


end
