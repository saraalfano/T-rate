# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  after_action :send_email, only: [:create]
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  def update_resource(resource, params)
    if resource.provider == 'google_oauth2'
        params.delete('current_password')
        resource.password = params['password']
      resource.update_without_password(params)
    else
      resource.update_without_password(params)
    end
  end

  def becometranslator
    @user=User.find(params[:id])
    @user.update_attribute(:ruolo, "Traduttore")
    redirect_back_or_to dashboard_path
  end

  def becomeuser
    @user=User.find(params[:id])
    @user.update_attribute(:ruolo, "Utente")
    redirect_back_or_to dashboard_path
  end

  def becomepm
    @user=User.find(params[:id])
    @user.update_attribute(:ruolo, "Project Manager")
    redirect_back_or_to dashboard_path
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:avatar, :username, :nome, :cognome])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end
  def send_email
    @mail=SuggestionMailer.welcome_email(params[:user][:email], params[:user][:username]).deliver_now
    flash[:success]= "Your email has been successfully sent ;)"  if @mail
  end
  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
