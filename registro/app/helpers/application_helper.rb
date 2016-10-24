module ApplicationHelper

  def userlogged_in?
    !current_user.nil?
  end

end
