class AddMadeStatusToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :made_status, :integer
  end
end
