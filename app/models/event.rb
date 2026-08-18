class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_many :orders, dependent: :destroy
  has_many :attendees, through: :orders, source: :user

  validates :title, presence: true
  validates :capacity, numericality: { greater_than: 0 }
end
