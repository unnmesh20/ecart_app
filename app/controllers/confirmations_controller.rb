class ConfirmationsController < Devise::ConfirmationsController
    skip_before_action :authenticate!
    def show
        self.resource = resource_class.confirm_by_token(params[:confirmation_token])
        # sign_in(resource)
        render json:{
            "master says": "Your email is confirmed. You can now sign in"
        }, status: :ok
        
    end

    # def send_reconfirmation_instructions
    # end
    
end
