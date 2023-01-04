class AddGenresIdToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :genres_id, :integer
  end
end
