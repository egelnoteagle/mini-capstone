class OrdersController < ApplicationController
  def create
    carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "carted")
    subtotal = 0
    tax = 0
    total = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price
      tax += carted_product.product.price * 0.09
      total += subtotal + tax
    end  

    @order = Order.new(user_id: current_user.id)

    @order.calculate_subtotal (product)
    @order.calculate_tax
    @order.calculate_total
    @order.save

    flash[:success] = 'Order Created'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.find(params[:id])
    @product = @order.product
  end
end
