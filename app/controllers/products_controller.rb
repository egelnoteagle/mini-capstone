class ProductsController < ApplicationController
  def one
    @product = Product.find(2)
  end 

  def all
    @products = Product.all
  end
end 

