module Api
    class CartItemsController < ApplicationController

        def create
            user_cart_items=current_user.cart.cart_items
            quantity =params[:quantity].to_i
            product_id = params[:product_id]
            add_item_to_cart = user_cart_items.new(
                    product_id: product_id,
                    quantity: quantity
                )
            if add_item_to_cart.save
                render json: add_item_to_cart
            else
                render json:{
                    "master says": "Unsuccessful",
                    errors: add_item_to_cart.errors
                }, status: :bad_request
            end
        end

        def show
            # cart_item = CartItem.where({cart_id:cart_id})
            cart_item = CartItem.find_by(id:params[:id])
            if cart_item.nil?
                render json: {"master says":"No items found in the cart."}
            else
                data = cart_item.format
                render json: data and return
            end
        end

        def update
             cart_item = current_user.cart_items.find params[:id]
            
            if cart_item.update(:quantity => params[:quantity])
                render json:{
                    "master says":"Successful",
                     cart_item: cart_item.format

                }, status: :ok
            else
                render json:{
                    "master says":"Unsuccessful",
                     cart_item: cart_item.format

                }, status: :bad_request
            end

        end


        def destroy
            cart_item = current_user.cart_items.find params[:id]
            cart_item.destroy
            render json:{
                "master says":"Deleted successfully",
                cart_item: cart_item.format
            }
        end

        # binding.pry
        # def get_cart_item
        #     @cart_item = current_user.cart_items.find params[:id]
        # rescue ActiveRecord::RecordNotFound
        #     render json:{
        #         success: false, error: "Not Found"
        #     }, status: :not_found and return
        # end

    end
end

