class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

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
