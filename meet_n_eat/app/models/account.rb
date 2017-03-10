class Account < ApplicationRecord
	has_many :created_events, class_name: "Event", foreign_key: "host_id"
	has_many :account_events, foreign_key: "account_id"
	has_many :attended_events, through: :account_events
end
