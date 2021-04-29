module Api
    class CartsController < ApplicationController
        def show
            cart_items=current_user.cart
            render json: cart_items
        end


    end

end
