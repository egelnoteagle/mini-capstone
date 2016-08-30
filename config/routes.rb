Rails.application.routes.draw do
  get '/' => 'products#index'
  get '/one' => 'products#one'
  get '/all' => 'products#all'
end
