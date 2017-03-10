class Account < ApplicationRecord
	has_many :created_events, class_name: "Event", foreign_key: "event_id"
end
