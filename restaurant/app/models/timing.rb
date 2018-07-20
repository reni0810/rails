class Timing < ApplicationRecord
  validates :day, presence: true, length: {maximum: 3}
  belongs_to :restaurant
end
