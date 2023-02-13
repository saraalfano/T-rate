class SuggestionsController < ApplicationController


    def create
        @traduzione=Translation.find(params[:traduzione])
        @corpo=params[:corpoemail]
    end

    def show
        @translation=Translation.find(params[:traduzione])
    end


    private
    # Only allow a list of trusted parameters through.
    def suggestion_params
        params.require(:suggestion).permit(:traduzione, :corpoemail)
    end
end
