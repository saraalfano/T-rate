class SuggestionMailer < ApplicationMailer
    default from: 'trateprojectassi@gmail.com'
    layout 'mailer'
    rescue_from Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError,
         Net::SMTPFatalError, Net::SMTPUnknownError do |exception|
        #handle it here
        :notice => "Problem sending email #{exception}"
        render :index 

    end
    
    def contact(email,subject,message)
        @message=message
        @email=email
        mail(to: 'trateprojectassi@gmail.com',:subject =>"#{subject}")
    end


    def welcome_email(email, username)
        @email= email
        @user = username
        mail(to: email,:subject =>"Benvenuto su T-rate!")
    end
end

