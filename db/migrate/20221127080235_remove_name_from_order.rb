class RemoveNameFromOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :Name, :string
  end
end
