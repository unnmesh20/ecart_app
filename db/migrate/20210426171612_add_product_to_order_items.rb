class AddProductToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :product_name, :string
    add_column :order_items, :product_price, :decimal
    add_reference :order_items, :product, null: false, foreign_key: true
  end
end
