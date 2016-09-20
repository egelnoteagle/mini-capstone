class CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "carted")
    if @carted_products == []
      redirect_to "/"
    end  
  end

  def create
    @carted_product = CartedProduct.create(
                                    user_id: current_user.id,
                                    quantity: params[:quantity],
                                    product_id: params[:product_id],
                                    status: "carted")
    flash[:success] = 'Item added to your cart.'
    redirect_to '/carted_products'
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")
  end
end
