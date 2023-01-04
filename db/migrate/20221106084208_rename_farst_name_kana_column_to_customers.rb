class RenameFarstNameKanaColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :farst_name_kana, :first_name_kana
  end
end
