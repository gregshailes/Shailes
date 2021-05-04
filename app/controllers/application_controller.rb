class ApplicationController < ActionController::Base

  def is_admin?
    current_user && current_user.is_admin?
  end

  def is_greg?
    current_user && current_user.is_greg?
  end

  def authenticate_admin!
    unless is_admin?
      redirect_to welcome_path, notice: 'You need to sign in.'
    end
  end

end
