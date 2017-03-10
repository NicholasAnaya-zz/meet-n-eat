class Event < ApplicationRecord
  belongs_to :host, class_name: "Account", foreign_key: "account_id"
  has_many :account_events
  has_many :guests, through: :account_events, class_name: "Account", foreign_key: "account_id"
end
