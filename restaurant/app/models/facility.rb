class Facility < ApplicationRecord
  validates :name, 		  presence: true, uniqueness: true
  validates	:description, presence: true
  has_many :restaurants_facilities
  has_many :restaurants , through: :restaurants_facilities
  accepts_nested_attributes_for :restaurants_facilities, allow_destroy: true
  accepts_nested_attributes_for :restaurants, 			 allow_destroy: true
end
