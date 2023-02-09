class CalendarController < ApplicationController
    def redirect
        client = Signet::OAuth2::Client.new(client_options)
    
        redirect_to client.authorization_uri.to_s, allow_other_host: true
    end
    
    def callback
        client = Signet::OAuth2::Client.new(client_options)
        client.code = params[:code]
    
        response = client.fetch_access_token!
    
        session[:authorization] = response
    
        redirect_to calendar_url
    end

    def events
        client = Signet::OAuth2::Client.new(client_options)
        client.update!(session[:authorization])

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = client

        @event_list = service.list_events(params[:calendar_id])
    end
    
    private
    
    def client_options
        {
        client_id: Rails.application.secrets.google_client_id,
        client_secret: Rails.application.secrets.google_client_secret,
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: callback_url
        }
    end

end
