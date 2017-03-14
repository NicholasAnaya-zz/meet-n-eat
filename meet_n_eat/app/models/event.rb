class Event < ApplicationRecord
  belongs_to :host, class_name: "Account"
  has_many :account_events, foreign_key: "event_id"
  has_many :guests, through: :account_events, source: :account

  # to do validations
  validates :spot, presence: true
  validates :budget, presence: true
  validates :location, presence: true
  validates :cuisine, presence: true
  validates :time, presence: true

  def self.event_search(arr, term)
    temp = arr
    temp = temp.select do |event| 
      (event.spot.include?(term) || event.location.include?(term) || event.cuisine.include?(term))
    end

    if temp.empty?
      return arr
    else
      return temp
    end
  end

 
end
