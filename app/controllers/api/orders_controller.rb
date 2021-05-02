module Api
    class OrdersController < ApplicationController
        def show
            specific_order=current_user.orders.find_by(id: params[:id])
            if specific_order.nil?
                render json: {"master_says":"No such orders found"}
            else
                render json: specific_order.format
            end
        end
        
        def index
            all_orders = current_user.orders
            # render json: all_orders
            data=[]
            all_orders.each do |single_order|
                data << single_order.format
            end  
            render json: data
        end
        
        def create
            order=current_user.create_order!
            if order.errors.blank?
                render json:{
                    "master_says":"Order successfully placed.",
                     order: order.format

                }, status: :ok
            else
                render json: {"master says":"No item found in the cart", error: order.errors}
            end
        end 
    
    end
    
end
