class OrdersController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    

    @order = Order.new(
      user_id: current_user.id,
      quantity: params[:quantity].to_i,
      product_id: params[:product_id])

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
