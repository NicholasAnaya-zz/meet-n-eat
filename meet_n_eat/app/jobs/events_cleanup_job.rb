class EventsCleanupJob < ActiveJob::Base
	queue_as :default

	def perform(*events)

	end
end