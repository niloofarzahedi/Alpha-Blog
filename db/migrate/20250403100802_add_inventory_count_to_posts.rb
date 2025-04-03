class AddInventoryCountToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :inventory_count, :integer
  end
end
