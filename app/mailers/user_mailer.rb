class UserMailer < ApplicationMailer
    def welcome_email(email)
        #@url  = 'http://example.com/login'
        puts "sto inviando aaaaaaaaaaaaaaaaaa"
        puts email
        mail(to: email, subject: "Benvenuto su Trate!<3")
    end
      
end
