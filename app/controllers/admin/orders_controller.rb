class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_orders_path(params[:id])
  end

  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
