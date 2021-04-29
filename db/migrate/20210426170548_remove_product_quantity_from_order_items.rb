class RemoveProductQuantityFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :product_quantity, :float
  end
end
