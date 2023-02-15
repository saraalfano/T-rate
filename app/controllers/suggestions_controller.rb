class SuggestionsController < ApplicationController
    def create
        @traduzione=Translation.find(params[:traduzione])
        @corpo=params[:corpoemail]
        send_email(@traduzione,@corpo,current_user.email)
    end
    def send_email(traduzione, corpo, email) 
        @mail=SuggestionMailer.contact(email,traduzione,corpo).deliver_now
        flash[:success]= "Your email has been successfully sent ;)"  if @mail
        redirect_to root_path    
    end
    def show
        @translation=Translation.find(params[:traduzione])
    end


    private
    # Only allow a list of trusted parameters through.
    def suggestion_params
        params.permit(:traduzione, :corpoemail)
    end
end
