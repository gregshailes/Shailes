class HomepageController < ApplicationController
  protect_from_forgery with: :exception

  layout 'homepage'

  before_action :set_which_page
  before_action :authenticate_admin!, only: [:root, :personal_menu, :work_menu]

  def root
    if is_greg?
      render :personal_menu
    else
      render :index
    end
  end


  private


  def set_which_page
    if params[:action] == 'work_menu'
      @which_page = 'work_menu'
    else
      @which_page = 'personal_menu'
    end
  end

end
