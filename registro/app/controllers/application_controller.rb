class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_alunno
  helper_method :current_amministrazione
  helper_method :current_docenza

  def current_alunno
    if session[:alunno_id]
      @current_alunno ||= Alunno.find(session[:alunno_id])
    end
  end
  
  def authenticate_alunno
    if current_alunno = nil?
      redirect_to loginalunno_url, :notice => "Eseguire login!"
    end
  end

  def current_docenza
    if session[:docenza_id]
      @current_docenza ||= Docenza.find(session[:docenza_id])
    end
  end
  
  def authenticate_docenza
    if current_docenza = nil?
      redirect_to logindocenza_url, :notice => "Eseguire login!"
    end
  end

  def current_amministrazione
    if session[:amministrazione_id]
      @current_amministrazione ||= Amministrazione.find(session[:amministrazione_id])
    end
  end
  
  def authenticate_amministrazione
    if current_amministrazione = nil?
      redirect_to loginamministrazione_url, :notice => "Eseguire login!"
    end
  end

end
