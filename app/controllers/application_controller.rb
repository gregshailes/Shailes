class ApplicationController < ActionController::Base

  def is_admin?
    current_user && current_user.is_admin?
  end

  def is_greg?
    current_user && current_user.is_greg?
  end

  def authenticate_greg!
    unless is_greg?
      redirect_to root_path
    end
  end

  def authenticate_admin!
    unless is_admin?
      redirect_to new_user_session_path
    end
  end

end
