class Cuisine < ApplicationRecord
  has_many :restaurants_cuisines
  has_many :restaurants , through: :restaurants_cuisines
  has_many :recipes
end
