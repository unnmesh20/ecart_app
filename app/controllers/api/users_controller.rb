module Api
    class UsersController < ApplicationController
        skip_before_action :authenticate!, only: [:create]
        def create
            email = params[:email]
            name = params[:name]
            password =params[:password]
            user = User.new(
                name:name,
                email:email,
                password:password
            )
            if user.save
                render json: {
                    "master says":"New user created",
                    name:user.name,
                    email:user.email    
                }, status: :ok
            else
                render json: { 
                    "master says":"Unsuccessful"
                }, status: :unauthorized
            end

        end

        def confirm_email
            user=User.find_by_confirm_token(params[:id])
            if user
                user.email_activate
                render json:{
                    "master says":"Successful" 
                }, status: :ok
            else
                render json:{
                    "master says":"Unsuccessful"
                }, status: :unauthorized
            end
        end

     
    end
    
end