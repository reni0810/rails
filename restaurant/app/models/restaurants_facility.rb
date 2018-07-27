class RestaurantsFacility < ApplicationRecord
  belongs_to :restaurant, optional: true
  belongs_to :facility, optional: true
  validates_uniqueness_of :facility_id, scope: :restaurant_id
end
