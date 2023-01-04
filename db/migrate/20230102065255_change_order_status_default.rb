class ChangeOrderStatusDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :orders, :order_status, from: 0, to: 1
  end
end
