Rails.application.routes.draw do
  
  resources :home, path: '/team/'
  root :to => 'home#index'
  
  resources :stats do
  	collection { post :import }
  end

end
