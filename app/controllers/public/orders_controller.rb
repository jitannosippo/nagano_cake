class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end
  
  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    @cart_items = CartItem.all
    @cart_items.each do |cart_item|
      @order_items = OrderItem.new
      @order_items.order_id = order.id
      @order_items.item_id = cart_item.item.id
      @order_items.order_price = cart_item.item.with_tax_price
      @order_items.amount = cart_item.amount
      @order_items.save
    end
    
    redirect_to orders_complete_path
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def comfirmation
    @order = Order.new(order_params)
    if params[:order][:x] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    end
    if params[:order][:x] == '1'
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    end
    
      
    @total = 0
    @cart_items = current_customer.cart_items
    @order.total_price = 0
    @order.postage = 800
  end


  def complete

  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method,:postage, :postal_code, :address,:name,:total_price)
  end

end
