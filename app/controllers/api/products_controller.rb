module Api
    class ProductsController < ApplicationController
      skip_before_action :authenticate!, only: [:index]
      before_action :fetch_category
      
      def index
        # binding.pry
        search=params[:product_name]
        data = @category.products
        if search.nil?
          products = @category.products.paginate(page: params[:page],per_page:5)
        else
          products =@category.products.where("name like :search", search: "%#{search}%").paginate(page: params[:page],per_page:5)
        end        
        render json: products
      end
  
      def show
        #binding.pry
        product = @category.products
                    .where(id: params[:id]).first
  
        data = product.attributes.symbolize_keys
        data.delete(:category_id)
        data.merge!(category: {
                      id: @category.id,
                      name: @category.name
                    })
        
        render json: data and return
      end
  
      private
  
      
      def fetch_category
        @category = Category.find params[:category_id]
      end

    end

  end