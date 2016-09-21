class CartedProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    # calls all carted products for this user id with status of carted
    if current_user && current_user.currently_carted.any?
      @carted_products = current_user.currently_carted
    else
      flash[:warning] = "Please Add Items To Your Cart."
      redirect_to '/'  
    end  
  end

  def create
    @carted_product = CartedProduct.create(user_id: current_user.id, quantity: params[:quantity], product_id: params[:product_id], status: "carted")

    flash[:success] = 'Item added to your cart.'
    redirect_to '/carted_products'
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "removed")
    flash[:success] = "Product Removed From Cart"
    redirect_to "/carted_products"
  end
end
