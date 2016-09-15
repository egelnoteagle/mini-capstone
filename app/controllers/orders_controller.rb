class OrdersController < ApplicationController
  def new
  end

  def create
    order = Order.create(
      user_id: params[:user_id],
      quantity: params[:quantity],
      product_id: params[:product_id])

    flash[:success] = 'Order Created'
    redirect_to '/orders/'
  end
end
