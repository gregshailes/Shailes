class HomepageController < ApplicationController
  protect_from_forgery with: :exception

  layout 'homepage'

  before_action :set_vars
  before_action :authenticate_admin!, only: [:root, :personal_menu, :work_menu]

  def root
    if is_greg?
      render :personal_menu
    else
      render :index
    end
  end


  private


  def set_vars
    if params[:action] == 'work_menu'
      @stylesheet = 'work_menu'
      @title = 'Work'
    else
      @stylesheet = 'personal_menu'
      @title = 'Home'
    end
  end

end
