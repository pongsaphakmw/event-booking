class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :name, presence: true
  validates :remaining_tickets, numericality: { greater_than_or_equal_to: 0 }
end
