Ritly::Application.routes.draw do
  root to: 'ritly#index'

  get '/go/:random_string/preview', to: 'ritly#preview', as: :preview

  get '/go/:random_string', to: 'ritly#go', as: :go

  get '/ritly/:id/show', to: 'ritly#show', as: :show

  post '/ritly', to: 'ritly#create', as: :create 

end
