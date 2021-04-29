module Api
    class CartItemsController < ApplicationController

        def create
            user_cart=current_user.cart
            add_item_to_cart = user_cart.cart_items.create(
                product_id:params[:product_id],
                quantity: rand(1...10)
            )
            render json: add_item_to_cart
        end

        def show
            # cart_items=@cart.cart_items.find.where(id: params[:id]).first
            # cart_id=current_user.cart.id
            # cart_item = CartItem.where({cart_id:cart_id})
            cart_item = CartItem.find_by(id:params[:id])
            data=cart_item.attributes.symbolize_keys
            data.delete(:cart_id)


            # render json: cart_item
            render json: data and return
        end

        def destroy
            # cart_items=current_user.cart.cart_items.find_by(id: params[:id])
            # cart_items.destroy
            @cart_item=CartItem.find_by(id:params[:id])
            @cart_item.destroy
        end

    end
end

