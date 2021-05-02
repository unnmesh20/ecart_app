class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items
    before_create :generate_invoice
    before_create :payment_status

    def generate_invoice
        self.invoice_number = rand(1000...100000)
    end
    def payment_status
        self.payment_status = true
    end

    def format
        data = []
        result=
        {
            order_id:self.id,
            payment_status:self.payment_status,
            invoice_number:self.invoice_number,
            # total_price:self.order_items.product_price * self.order_items.quantity
            order_item_details:self.order_items

        }
        self.order_items.each do |order_item|
            data << order_item.format
        end
        result[:items] = data
        return result

        
    end

end
