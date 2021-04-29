module Api
    class OrdersController < ApplicationController
        def show
            # all_orders = current_user.orders.find_by(user_id:current_user.id)
            specific_order=current_user.orders.find_by(id: params[:id])
            if specific_order.nil?
                render json: {"master_says":"No such orders found"}
            else

                specific_order_details=specific_order.order_items
                render json: {
                    order_id:specific_order.id,
                    payment_status:specific_order.payment_status,
                    invoice_number:specific_order.invoice_number,
                    order_details:specific_order_details

                }
            end

        end
        
        def index
            all_orders = current_user.orders.where(user_id:current_user.id)

            render json: all_orders
            
        end
        
        def create
            cart_items_list=current_user.cart.cart_items
            order_creation = Order.create(user_id:current_user.id,payment_status:"yes",invoice_number: rand(1000...100000))
            adding_item_to_order_list = cart_items_list.each do |item|
                order_creation.order_items.create(
                    product_id: item.product_id,
                    quantity: item.quantity
                )
            end
            # #  binding.pry
            # @current_user_cart_item=current_user.cart.cart_items.where(cart_id:current_user.cart)
            # @current_user_cart_item.destroy
            # render json: adding_item_to_order_list



        end

        private
        def fetch_order
            @order=current_user.orders.find params[:order_id]
        end


    
    end
    
end
