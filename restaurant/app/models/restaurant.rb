class Restaurant < ApplicationRecord
  validates :name,:address,:mobile_no, presence: true
  validates :name,                     uniqueness: true
  validates :mobile_no,                numericality: true, length: { maximum: 15 } ,uniqueness: true
  has_many :restaurants_cuisines, dependent: :destroy
  has_many :cuisines , through: :restaurants_cuisines
  has_many :restaurants_facilities, dependent: :destroy
  has_many :facilities , through: :restaurants_facilities
  has_many :unavailabities, dependent: :destroy
  has_many :timings, dependent: :destroy
  belongs_to :user,optional: true
  has_one_attached :picture
  accepts_nested_attributes_for :timings,:unavailabities, allow_destroy: true
  accepts_nested_attributes_for :restaurants_cuisines,:restaurants_facilities, allow_destroy: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
