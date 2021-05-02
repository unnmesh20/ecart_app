class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product
    
    def format
        {
            id:self.id,
            quantity:self.quantity,
            price: self.quantity*self.product_price,
            product:{
                id:self.product_id,
                product_name:self.product_name,
                price:self.product_price

            }
        }
    end

end
