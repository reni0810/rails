class RestaurantsFacility < ApplicationRecord
  belongs_to :restaurant
  belongs_to :facility
end
