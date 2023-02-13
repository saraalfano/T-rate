require 'differ'
class DashboardController < ApplicationController
    before_action :require_login
    before_action do
        ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
    end

    def require_login
        if !current_user
            redirect_to new_user_session_path
        end
    end

    def spellcheck
        traduzione=Translation.find(params[:traduzione])
        @originale=traduzione.tradotto.download.bytes.pack("c*").force_encoding("UTF-8")
        @corretto=Spellchecker.check(@originale)
        # @correzioni = Differ.diff_by_line(@corretto, @testo)
    end

end