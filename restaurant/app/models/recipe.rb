class Recipe < ApplicationRecord
  validates :name, 		  presence: true, uniqueness: true
  validates :description, presence: true
  belongs_to :cuisine
  has_many :restaurants_cuisines_recipes
end
