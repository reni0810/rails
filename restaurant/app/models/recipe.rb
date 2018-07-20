class Recipe < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :cuisine
end
