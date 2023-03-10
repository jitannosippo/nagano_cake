class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
  end
  
  def update
    order = Order.find(params[:id])
    order.update(order_status:params[:order][:order_status].to_i)
    redirect_to admin_order_path(params[:id])
  end

  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
