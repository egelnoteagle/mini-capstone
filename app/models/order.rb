class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def calculate_subtotal(product_object)
    self.subtotal = product_object.price * quantity
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end
end
