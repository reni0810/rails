class Restaurant < ApplicationRecord
  validates :name,:address,:mobile_no, presence: true
  has_many :timings , dependent: :destroy
  has_many :restaurants_cuisines, dependent: :destroy
  has_many :cuisines , through: :restaurants_cuisines
  has_many :restaurants_facilities, dependent: :destroy
  has_many :facilities , through: :restaurants_facilities
  has_and_belongs_to_many :users
end
