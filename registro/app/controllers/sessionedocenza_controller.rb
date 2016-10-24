class SessionedocenzaController < ApplicationController
  def new
  end
 
  def create
    docenza = Docenza.authenticate(params[:email], params[:password])
    if docenza
      session[:docenza_id]=docenza.id
      redirect_to menudocenza_url, :notice => "#{docenza.email} login avvenuto con successo"
    else 
      flash[:notice] = "Email o password errati"
      redirect_to logindocenza_url
    end
  end

  def destroy
    session[:docenza_id] = nil
    redirect_to root_url, :notice => "Logout effettuato!"
  end
end
