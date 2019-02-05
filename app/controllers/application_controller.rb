class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :init_user

  def init_user
    if current_user
      @self_user = User.find(current_user)
    end
  end

  def check_login
    if current_user == nil
      redirect_to sign_up_path
    end
  end
end
