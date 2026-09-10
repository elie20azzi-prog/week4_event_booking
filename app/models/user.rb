class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :events, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :booked_events, through: :orders, source: :event
end
