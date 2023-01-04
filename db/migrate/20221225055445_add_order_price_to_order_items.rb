class AddOrderPriceToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :order_price, :integer
  end
end
