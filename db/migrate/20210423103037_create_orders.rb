class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :invoice_number
      t.boolean :payment_status

      t.timestamps
    end
  end
end
