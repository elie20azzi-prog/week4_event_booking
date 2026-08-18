class Ticket < ApplicationRecord
  belongs_to :order

  validates :ticket_number, presence: true, uniqueness: true
end
