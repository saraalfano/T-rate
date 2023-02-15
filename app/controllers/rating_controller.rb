class RatingController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    # GET /ratings or /ratings.json
    def index
        @ratings = Rating.all
    end
    
    # GET /ratings/1 or /ratings/1.json
    def show
    end
    
    # GET /ratings/new
    def new
        @rating = current_user.rating.build
    end
    
    # GET /ratings/1/edit
    def edit
    end
    
    # POST /ratings or /ratings.json
    def create
        if Rating.create(voto: params[:voto], user: current_user, translation: Translation.find(params[:translation]))
            redirect_back_or_to '/dashboard', allow_other_host: false
        end
    end
    
    # PATCH/PUT /ratings/1 or /ratings/1.json
    def update
        respond_to do |format|
        if @rating.update(rating_params)
            format.html { redirect_to dashboard_path }
            format.json { render :show, status: :ok, location: @rating }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @rating.errors, status: :unprocessable_entity }
        end
        end
    end
    
    # DELETE /ratings/1 or /ratings/1.json
    def destroy
        @rating.destroy
    
        respond_to do |format|
        format.html { redirect_to ratings_url, notice: "Rating was successfully destroyed." }
        format.json { head :no_content }
        end
    end
    
    def correct_user
        @rating = current_user.rating.find(params[:id])
        redirect_to root_path if @rating.nil?
    end
    
    def require_login
        if !current_user
            redirect_to new_user_session_path
        end
    end

    private
    
        # Only allow a list of trusted parameters through.
        def rating_params
            params.require(:rating).permit(:user_id, :translation_id)
        end
      
end
