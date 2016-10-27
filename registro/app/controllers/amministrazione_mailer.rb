class AmministrazioneMailer < ActionMailer::Base
    default :from => "registroelettronicoapp@gmail.com"

 def registration_confirmation(amministrazione)
    @amministrazione = amministrazione
    mail(:to => @amministrazione.email , :subject => "Registration Confirmation")
 end

end

