class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :init_user

  def init_user
    if current_user
      @self_user = User.find_by_id(current_user)
    end
  end

  def check_login
    unless @self_user
      redirect_to sign_up_path
    end
  end
  def check_no_login
    if current_user
      go_to_user
    end
  end
  def go_to_user
    redirect_to user_path(current_user)
  end
  def admin?
    if @self_user.user_role.status != "admin"
      flash[:not_admin] = "You are not admin"
      go_to_user
    end
  end

end
