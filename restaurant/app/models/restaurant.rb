class Restaurant < ApplicationRecord
  validates :name,:address,:mobile_no, presence: true
  validates :mobile_no, format: { with: /[0-9]/, message: "only number"}, length: { maximum: 15 } ,uniqueness: true
  has_many :restaurants_cuisines, dependent: :destroy
  has_many :cuisines , through: :restaurants_cuisines
  has_many :restaurants_facilities, dependent: :destroy
  has_many :facilities , through: :restaurants_facilities
  belongs_to :user,optional: true
  has_many :unavailabities, dependent: :destroy
  has_many :timings, dependent: :destroy
  accepts_nested_attributes_for :timings,:cuisines,:facilities,:unavailabities, allow_destroy: true
  accepts_nested_attributes_for :restaurants_cuisines,:restaurants_facilities, allow_destroy: true
end
