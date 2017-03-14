class EventsController < ApplicationController
	before_action :account_logged_in
	before_action :check_if_own_page, only: [:edit]

	def index
		if params[:account_id]
			@personal = true
			@my_events = Account.all_events_for_account(current_account.id)
		else
			if (params[:term])
				@available_events = Account.all_available_events(current_account.id)
				@available_events = Event.event_search(@available_events, params[:term])
			else 
				@available_events = Account.all_available_events(current_account.id)
			end
		end
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
			flash[:error] = "Unsuccessfully updated #{event.spot}."
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

	def join
		event = Event.find(params[:id])
		event.guests << current_account
		event.save
		flash[:message] = "Successfully joined #{event.spot}"
		redirect_to events_path
	end

	def leave
		event = Event.find(params[:id])
		event.guests.delete(current_account)
		event.save
		flash[:message] = "Successfully left #{event.spot}"
		redirect_to account_events_path(current_account)
	end

	def destroy
		event = Event.find(params[:id])
		event.destroy
		flash[:message] = "Successfully deleted #{event.spot}"
		redirect_to account_events_path(current_account)
	end

	private

	def check_if_own_page
		unless session[:account_id] === Event.find(params[:id].to_i).host.id
			flash[:error] = "Sorry, you do not have permission to do that."
			redirect_to event_path(params[:id])
		end
	end

	def event_params
		return params.require(:event).permit(:spot, :budget, :location, :cuisine, :time, :host_id)
	end

end
