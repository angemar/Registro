class SessionealunnoController < ApplicationController
  def new
  end
 
  def create
    alunno = Alunno.authenticate(params[:email], params[:password])
    if alunno && alunno.email_confirmed
        session[:role]='alunno'
        session[:alunno_id]=alunno.id
        redirect_to menualunno_url, :notice => "#{alunno.email} login avvenuto con successo"
    else 
      flash[:notice] = "Email o password errati o email non confermato"
      redirect_to loginalunno_url
    end
  end

  def destroy
    session[:alunno_id] = nil
    redirect_to root_url, :notice => "Logout effettuato!"
  end
end
