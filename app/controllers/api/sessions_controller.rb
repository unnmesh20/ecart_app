module Api
    class SessionsController < ApplicationController
      skip_before_action :authenticate!
      def create
        user = User.where(
          email: params[:email]
        ).first

        #binding.pry

        if user.blank?
          render json:{
            "master says":"Invalid autentication",
            success:false
          }, status: :unauthorized and return
        end
          
  
        if user.valid_password?(params[:password])
          # token = user.generate_token!
          token = encode_token({id: user.id})
          user.update(token:token,token_created_at:Time.now)
          render json: {user: {
                          id: user.id,
                          email: user.email,
                          name: user.name,
                          token: token
                        }}, status: :ok
        else
          render json: {status: 401, error: true, message: 'Unauthorized'}, status: :unauthorized
        end
      end

    end
  end