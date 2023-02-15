class ClassificaController < ApplicationController
    before_action :require_login

    before_action do
        ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end
    
    def require_login
        if !current_user
            redirect_to new_user_session_path
        end
    end
end
