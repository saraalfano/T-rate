class SuggestionsController < ApplicationController


    def create
        @translation=Translation.find[params[:id]]
        @corpo=params[:corpoemail]
        #Fare cose
    end


    private
    # Only allow a list of trusted parameters through.
    def translation_params
        params.require(:suggestion).permit(:id, :corpoemail)
    end
end
