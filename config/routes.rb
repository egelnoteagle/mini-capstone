Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/records' => 'products#index'
  get '/records/random' => 'products#random'

  get '/records/new' => 'products#new'
  post '/records' => 'products#create'

  get '/records/:id' => 'products#show'

  get '/records/:id/edit' => 'products#edit'
  patch '/records/:id' => 'products#update'

  delete '/records/:id' => 'products#destroy'
end
