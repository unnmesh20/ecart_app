class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.string :product_name
      t.float :product_price
      t.integer :product_quantity

      t.timestamps
    end
  end
end
