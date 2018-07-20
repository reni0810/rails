class User < ApplicationRecord
  validates :name, :email, :mobile_no, presence: true
  validates :mobile_no, format: { with: /[0-9]/, message: "only number"}, length: { maximum: 15 }
  validates :email, format: { with: /\b[a-z0-9A-Z]+@[a-z0-9A-Z]+\.[a-zA-Z]{2,4}\b/, message: "Invalid Email"}
  has_and_belongs_to_many :restaurants
end
