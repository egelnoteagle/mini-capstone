class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :category_products
  has_many :products, through: :category_products
end
