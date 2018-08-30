class RestaurantsCuisinesRecipe < ApplicationRecord
  belongs_to :restaurants_cuisine, optional: true
  belongs_to :recipe, optional: true
end
