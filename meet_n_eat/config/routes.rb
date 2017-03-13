Rails.application.routes.draw do

	root 'static#home'

	get '/signin', to: 'sessions#new'
	post '/signin', to: 'sessions#create' #change destination
	get '/signout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events
  resources :accounts do
  	resources :events, only: [:index, :show]
  end

end
