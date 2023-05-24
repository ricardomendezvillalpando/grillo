Rails.application.routes.draw do
  post '/metric/:key', to: 'metrics#create'
  delete '/metric/:key', to: 'metrics#destroy'
  get '/metrics', to: 'metrics#index'
end
