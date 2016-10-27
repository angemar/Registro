class DocenzaMailer < ActionMailer::Base
    default :from => "registroelettronicoapp@gmail.com"

 def registration_confirmation(docenza)
    @docenza = docenza
    mail(:to => @docenza.email , :subject => "Registration Confirmation")
 end

end

