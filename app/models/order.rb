class Order < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_one :ticket, dependent: :destroy

  validates :event_id, uniqueness: { scope: :user_id, message: "has already been booked" }
end
