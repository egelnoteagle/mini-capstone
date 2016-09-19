class CartedProduct < ApplicationRecord
  belongs_to :products
  belongs_to :users
  belongs_to :orders, optional: true
end
