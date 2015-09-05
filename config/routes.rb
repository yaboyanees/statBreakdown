Rails.application.routes.draw do

	resources :portfolio
	resources :ranking
	
	resources :home, path: '/team/'
	root :to => 'home#index'
	
	resources :stats, except: [:destroy] do
		collection { post :import }
		collection { delete :kill }
	end
	
end
