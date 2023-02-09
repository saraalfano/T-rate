class WelcomeController < ApplicationController
  
  def index
    if current_user
      if current_user.ruolo=='Project Manager'
        redirect_to dashboardpm_path
      elsif current_user.ruolo=='Traduttore'
          redirect_to dashboardtraduttore_path
      else
        redirect_to dashboardutente_path
      end
    end
  end
  
end
