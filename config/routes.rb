Rails.application.routes.draw do

  root :to => 'splash#index'

	resources :portfolio, path: '/my-team/'
	resources :ranking, path: '/rankings/'
	
	resources :home, path: '/match-up/'
	
	resources :stats, except: [:destroy] do
		collection { post :import }
		collection { delete :kill }
	end
	
end
