Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/records' => 'products#index'
  get '/suppliers' => 'suppliers#index'
  get '/records/random' => 'products#random'

  get '/records/new' => 'products#new'
  get '/suppliers/new' => 'suppliers#new'
  post '/records' => 'products#create'
  post '/suppliers' => 'suppliers#create'

  get '/records/:id' => 'products#show'
  get 'suppliers/:id' => 'suppliers#show'

  get '/records/:id/edit' => 'products#edit'
  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch '/records/:id' => 'products#update'
  patch '/suppliers/:id' => 'suppliers#update'

  delete '/records/:id' => 'products#destroy'
  delete '/suppliers/:id' => 'suppliers#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
