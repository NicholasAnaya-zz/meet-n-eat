Rails.application.routes.draw do

	root 'static#home'

	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create' #change destination
	delete '/signin', to: 'sessions#destroy'

	resources :accounts


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
