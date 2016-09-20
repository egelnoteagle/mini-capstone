Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/records' => 'products#index'
  get '/suppliers' => 'suppliers#index'
  get '/records/random' => 'products#random'

  get '/records/new' => 'products#new'
  get '/suppliers/new' => 'suppliers#new'
  post '/records' => 'products#create'
  post '/suppliers' => 'suppliers#create'
  post '/login' => 'sessions#create'

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
  
  delete '/logout' => 'sessions#destroy'

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  get '/carted_products/:id' => 'carted_products#show'
end
