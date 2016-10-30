class SessioneamministrazioneController < ApplicationController
  def new
  end
 
  def create
    amministrazione = Amministrazione.authenticate(params[:email], params[:password])
    if amministrazione #&& amministrazione.email_confirmed
      session[:role]='amministrazione'
      session[:amministrazione_id]=amministrazione.id
      redirect_to menuamministrazione_url, :notice => "#{amministrazione.email} login avvenuto con successo"
    else 
      flash[:notice] = "Email o password errati o email non confermato"
      redirect_to loginamministrazione_url
    end
  end

  def destroy
    session[:amministrazione_id] = nil
    redirect_to root_url, :notice => "Logout effettuato!"
  end
end
