Store::Application.routes.draw do
  
  root 'cats#index'

  resources :products, :cats

end
