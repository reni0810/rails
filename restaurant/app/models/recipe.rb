class Recipe < ApplicationRecord
  validates :name, 		  presence: true, uniqueness: true
  validates :description, presence: true
  belongs_to :cuisine
  has_many :restaurants_cuisines_recipes
  accepts_nested_attributes_for :restaurants_cuisines_recipes, allow_destroy: true
end
