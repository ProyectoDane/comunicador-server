ComunicadorServer::Application.routes.draw do
  root to: 'exchanges#index'

  resources :exchanges
end
