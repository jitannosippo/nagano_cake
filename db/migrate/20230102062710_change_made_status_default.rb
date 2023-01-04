class ChangeMadeStatusDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :order_items, :made_status, from: 0, to: 1
  end
end
