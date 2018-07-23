class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name,:email, presence: true
  validates :email, format: {with: /\b[a-zA-Z0-9]+@[A-Z0-9a-z]+\.[a-z]{2,4}\b/, message: "Invalid email"}, uniqueness: true
  validates :mobile_no,presence: true, format: { with: /[0-9]/, message: "only number"}, length: { maximum: 15 }, uniqueness: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :restaurants
end
