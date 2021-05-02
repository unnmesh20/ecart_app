class CartItem < ApplicationRecord
    MINIMUM_QUANTITY=1
    belongs_to :cart
    belongs_to :product
    validate :validate_quantity

    def validate_quantity
        if quantity < MINIMUM_QUANTITY
            cart_items.errors.add(:quantity, "Quantity cannot be less than 1")
        end
    end

    def format
        {
            id: self.id,
            cart_id: self.cart.id,
            created_at: created_at,
            quantity: quantity,
            product:{
                id: product.id,
                name:product.name,
                price: product.price
            }
        }
    end
end
