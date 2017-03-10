class Event < ApplicationRecord
  belongs_to :host, foreign_key: "account_id", class_name: "Account"
  has_many :account_events
  has_many :guests, through: :account_events
end
