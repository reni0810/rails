class Cuisine < ApplicationRecord
  validates :name,:description, presence: true, uniqueness: true
  has_many :restaurants_cuisines,dependent: :destroy
  has_many :restaurants , through: :restaurants_cuisines
  has_many :recipes
end
