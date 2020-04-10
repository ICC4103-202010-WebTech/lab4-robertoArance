class Customer < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :email, confirmation: true
  validates :email, uniqueness: true
  has_many :orders
  has_many :tickets, through: :orders
end
