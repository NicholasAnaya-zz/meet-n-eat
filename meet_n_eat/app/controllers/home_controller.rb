class HomeController < ApplicationController
	def index
		if (logged_in?)
			@events = Account.events_coming_up(current_account)
		else 
			@events = Event.events_coming_up
		end
	end
end