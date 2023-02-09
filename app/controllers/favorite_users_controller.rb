class FavoriteUsersController < ApplicationController
    before_action :set_user
    before_action :require_login
  
  def create
    if Favorite.create(favorited: @user, user: current_user)
      redirect_back_or_to '/dashboard', allow_other_host: false
    end
  end
  
  def destroy
    Favorite.where(favorited_id: @user.id, user_id: current_user.id).first.destroy
    redirect_back_or_to '/dashboard', allow_other_host: false
  end
  
  private
  
  def set_user
    @user = User.find(params[:utente_id] || params[:id])
  end

  def require_login
    if !current_user
        redirect_to new_user_session_path
    end
end
end
