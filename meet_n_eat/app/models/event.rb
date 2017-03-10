class Event < ApplicationRecord
  belongs_to :host, class_name: "Account"
  has_many :account_events, foreign_key: "event_id"
  has_many :guests, through: :account_events, source: :account

  # to do validations
end