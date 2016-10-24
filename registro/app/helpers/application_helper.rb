module ApplicationHelper

  def alunnologged_in?
    !current_alunno.nil?
  end

  def docenzalogged_in?
    !current_docenza.nil?
  end

  def amministrazionelogged_in?
    !current_amministrazione.nil?
  end

end
