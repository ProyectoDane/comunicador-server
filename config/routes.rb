ComunicadorServer::Application.routes.draw do
  root to: 'exchanges#index'

  resources :exchanges do
    get :by_month, on: :collection
    get :by_receiver_name, on: :collection
    get :by_user_name, on: :collection
  end
end
