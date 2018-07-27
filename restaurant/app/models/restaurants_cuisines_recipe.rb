class RestaurantsCuisinesRecipe < ApplicationRecord
  belongs_to :restaurants_cuisine, optional: true
end
