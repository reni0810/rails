class Restaurant < ApplicationRecord
  validates :name,:address,:mobile_no, presence: true
  validates :mobile_no, format: { with: /[0-9]/, message: "only number"}, length: { maximum: 15 } ,uniqueness: true
  has_many :timings , dependent: :destroy
  has_many :restaurants_cuisines, dependent: :destroy
  has_many :cuisines , through: :restaurants_cuisines
  has_many :restaurants_facilities, dependent: :destroy
  has_many :facilities , through: :restaurants_facilities
  has_and_belongs_to_many :users
  has_many :unavailabities
end
