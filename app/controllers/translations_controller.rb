class TranslationsController < ApplicationController
  before_action :set_translation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  # GET /translations or /translations.json
  def index
    @translations = Translation.all
  end

  # GET /translations/1 or /translations/1.json
  def show
  end

  # GET /translations/new
  def new
    @translation = current_user.translation.build
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations or /translations.json
  def create
    @translation = current_user.translation.build(translation_params)

    respond_to do |format|
      if @translation.save
        format.html { redirect_to dashboardtraduttore_path }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1 or /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to dashboardtraduttore_path }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1 or /translations/1.json
  def destroy
    @translation.destroy
    redirect_back_or_to '/classifica', allow_other_host: false

  end

  def correct_user
    @translation = current_user.translation.find(params[:id])
    redirect_to root_path if @translation.nil?
  end

  def require_login
    if !current_user
        redirect_to new_user_session_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def translation_params
      params.require(:translation).permit(:titolo, :tipo, :stagione, :episodio, :traduttore_id, :tradotto)
    end
end
