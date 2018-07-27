class Cuisine < ApplicationRecord
  validates :name, presence: true
  has_many :restaurants_cuisines,dependent: :destroy
  has_many :restaurants , through: :restaurants_cuisines
  has_many :recipes
  accepts_nested_attributes_for :restaurants_cuisines,allow_destroy: true
  accepts_nested_attributes_for :restaurants, allow_destroy: true
end
