class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user

  def current_user
		if session[:role] == 'alunno'
			@current_user ||= Alunno.find(session[:alunno_id])
		elsif session[:role] == 'docenza'
			@current_user ||= Docenza.find(session[:docenza_id])
		elsif session[:role] == 'amministrazione'
			@current_user ||= Amministrazione.find(session[:amministrazione_id])
		end 
  end
  
  def authenticate_alunno
    if current_alunno = nil?
      redirect_to loginalunno_url, :notice => "Eseguire login!"
    end
  end
  
  def authenticate_docenza
    if current_docenza = nil?
      redirect_to logindocenza_url, :notice => "Eseguire login!"
    end
  end

  def authenticate_amministrazione
    if current_amministrazione = nil?
      redirect_to loginamministrazione_url, :notice => "Eseguire login!"
    end
  end

end
