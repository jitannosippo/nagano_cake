class AddAmountToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :amount, :integer
  end
end
