require 'google/api_client/client_secrets.rb'
require 'google/apis/calendar_v3'
require 'httparty'
CALENDAR_ID = 'trateproject@gmail.com'

class TranslationsController < ApplicationController
  before_action :set_translation, only: %i[:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :sync_with_google, only: [:gettranslation]

  # GET /translations or /translations.json
  
  def index
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    @event_list = service.list_events(CALENDAR_ID)
  end

  # GET /translations/1 or /translations/1.json
  def show
    @translations = Translation.all
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event_list = service.list_events(CALENDAR_ID)
  end

  # GET /translations/new
  def new
    @translation = current_user.translations.build
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations or /translations.json
  def create
    
    @translation = current_user.translations.build(translation_params)
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])
    

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    event = Google::Apis::CalendarV3::Event.new(**{
      start: Google::Apis::CalendarV3::EventDateTime.new(date: @translation.deadline.strftime("%Y-%m-%d")),
      end: Google::Apis::CalendarV3::EventDateTime.new(date: (@translation.deadline+1).strftime("%Y-%m-%d")),
      summary: @translation.titolo
    })

    @evento=service.insert_event(CALENDAR_ID, event)
    @translation.update(:event_id => @evento.id)
    @translation.save
    redirect_to dashboardpm_path
    rescue Google::Apis::AuthorizationError
      response = client.refresh!
      
      session[:authorization] = session[:authorization].merge(response)

      retry
  end

  # PATCH/PUT /translations/1 or /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to root_path }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1 or /translations/1.json
  def destroy
    @translation=Translation.find(params[:id])
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client
    
    service.delete_event(CALENDAR_ID, @translation.event_id)
    @translation.destroy
    redirect_back_or_to '/classifica', allow_other_host: false
  rescue Google::Apis::ClientError
    @translation.destroy
    redirect_back_or_to '/classifica', allow_other_host: false

  end

  def correct_user
    @translation = Translation.find(params[:id])
    redirect_to root_path if @translation.nil?
  end

  def require_login
    if !current_user
        redirect_to new_user_session_path
    end
  end



##############-CALENDAR CONTROLLER-##################

  def redirect
    client = Signet::OAuth2::Client.new(client_options)

    redirect_to client.authorization_uri.to_s, allow_other_host: true
  end
  
  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]
    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to translations_url
  end

  def delete_event
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    service.delete_event(CALENDAR_ID, params[:event_id])

    redirect_to events_url(CALENDAR_ID)
  end

  def gettranslation
    @translation = Translation.where(id: params[:traduzione])
    if @translation
      @translation = Translation.find(params[:traduzione])
      @translation.traduttore_id=params[:utente]
      @translation.got=true
      @translation.save
    end
    redirect_back_or_to calendar_path
  end
      
  ##############################################################################################################

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def translation_params
      params.require(:translation).permit(:titolo, :tipo, :deadline, :stagione, :episodio, :revisore_id, :got, :originale, :tradotto, :revisionato)
    end
    

    ##############-PRIVATE CALENDAR-##################

    def sync_with_google
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])

      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client

      Translation.all.each do |t|
        @evento = service.get_event(CALENDAR_ID, t.event_id)
        if @evento && @evento.status != "cancelled"
        else
          t.destroy
        end
      end
    end

    def client_options
      {
        client_id: Rails.application.secrets.google_client_id,
        client_secret: Rails.application.secrets.google_client_secret,
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: callback_url,
        access_token:"ya29.a0AVvZVsqEQbWgZNKxnZE0un_6XPXlG24775a5jACAnKRnl6IhhP2pfZv98GoMbJ183ZkM0DH-qCYZZgtTXGA1-WgMRd-TplAHRrpYCYNo4JavfqACbi1iaC57uf3TKSCbt2Ut-MEvzOKiB12m2U0RGx1pVJDXaCgYKAQ8SARESFQGbdwaI8_kcC59-e2zMmGzhSZkT1w0163"
      }
    end
    ##############################################################################################################
end
