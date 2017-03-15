class Account < ApplicationRecord
  has_secure_password
  include Gravtastic
  gravtastic

  #Relationships
  has_many :created_events, class_name: "Event", foreign_key: "host_id"
  has_many :account_events, foreign_key: "account_id"
  has_many :attended_events, through: :account_events, source: :event

  #Validations
  validates :username, presence: true, uniqueness: true
  validates :email, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.all_events_for_account(id)
    account = Account.find(id)
    return (account.attended_events + account.created_events).select { |event| event.is_active? }
  end

  def self.events_coming_up(id)
    return self.all_events_for_account(id).sort { |a, b| a.time <=> b.time }.take(5)
  end

  def self.all_available_events(id)
    account = Account.find(id)
    unavailable_events = Account.all_events_for_account(account.id)
    return Event.select { |event| event.is_active? && !unavailable_events.include?(event) }
  end

end
