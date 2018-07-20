class Facility < ApplicationRecord
  has_many :restaurants_facilities
  has_many :restaurants , through: :restaurants_facilities
end
