class RemoveProductNameFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :order_items, :product_name, :varchar
  end
end
