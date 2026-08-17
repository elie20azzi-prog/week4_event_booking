class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :booked_events, through: :orders, source: :event

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
