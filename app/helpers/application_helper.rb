module ApplicationHelper
  def login(id)
    session[:user_id] = id
  end

  def logout
    session[:user_id] = nil
  end
  def current_user
    session[:user_id]
  end

end
