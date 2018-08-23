class Facility < ApplicationRecord
  validates :name, 		  presence: true, uniqueness: true
  validates	:description, presence: true
  has_many :restaurants_facilities
  has_many :restaurants , through: :restaurants_facilities
end
