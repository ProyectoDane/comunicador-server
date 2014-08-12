ComunicadorServer::Application.routes.draw do
  root to: 'interactions#index'

  resources :interactions
end
