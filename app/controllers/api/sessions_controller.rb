module Api
    class SessionsController < ApplicationController
      skip_before_action :authenticate!
      def create
        user = User.where(
          email: params[:email]
        ).first

        if user.blank?
          render json:{
            "master says":"Invalid autentication",
            success:false
          }, status: :unauthorized and return
        end
          
  
        if user.valid_password?(params[:password])
          token = user.generate_token!
          render json: {user: {
                          id: user.id,
                          email: user.email,
                          name: user.name
                        }}, status: :ok
        else
          render json: {status: 401, error: true, message: 'Unauthorized'}, status: :unauthorized
        end

      end
    end
  end