class RemoveGenresIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :genres_id, :integer
  end
end
