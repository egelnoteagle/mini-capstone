class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :users, through: :carted_products
  has_many :orders, through: :carted_products


  def tax
    price.to_f * 0.09
  end 

  def total
    price.to_f + tax
  end

  def discounted?
    price.to_f < 20
  end

  def top_image
    images.first.url
  end
end
