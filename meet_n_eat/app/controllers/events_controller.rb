class EventsController < ApplicationController
	before_action :account_logged_in

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new()
	end

	def create
		event = Event.new(event_params)
		event.host_id = session[:account_id] #add host_id to our event so it can validate
		if event.valid?
			event.save
			redirect_to event_path(event)
		else
			# need to add flash message here
			redirect_to new_event_path
		end
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		event = Event.find(params[:id])
		if (event.update(event_params))
			redirect_to event_path(event)
		else
			redirect_to edit_event_path(event)
		end
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
		#flash message here like "successfully deleted event"?
		redirect_to events_path
	end

	private


	def event_params
		return params.require(:event).permit(:spot, :budget, :location, :cuisine, :time, :host_id)
	end

end
