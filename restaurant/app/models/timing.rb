class Timing < ApplicationRecord
  validates :day, presence: true, length: {is: 3}
  belongs_to :restaurant
end
