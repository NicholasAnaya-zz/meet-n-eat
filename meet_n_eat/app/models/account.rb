class Account < ApplicationRecord
  has_many :created_events, class_name: "Event", foreign_key: "host_id"
  has_many :account_events, foreign_key: "account_id"
  has_many :attended_events, through: :account_events, source: :event

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: {minimum: 8}
  validates :email, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
