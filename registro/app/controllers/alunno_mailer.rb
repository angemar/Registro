class AlunnoMailer < ActionMailer::Base
    default :from => "registroelettronicoapp@gmail.com"

 def registration_confirmation(alunno)
    @alunno = alunno
    mail(:to => @alunno.email , :subject => "Registration Confirmation")
 end

end


