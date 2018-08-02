class RestaurantsCuisine < ApplicationRecord
  validates_uniqueness_of :cuisine_id, scope: :restaurant_id
  belongs_to :restaurant, optional: true
  belongs_to :cuisine, 	  optional: true
  has_many  :restaurants_cuisines_recipes, dependent: :destroy
  accepts_nested_attributes_for :restaurants_cuisines_recipes, allow_destroy: true
end
