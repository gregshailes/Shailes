class HomepageController < ApplicationController
  protect_from_forgery with: :exception

  before_action :authenticate_admin!, only: [:root, :personal_menu, :work_menu]

  def root
    if is_greg?
      render :personal_menu
    else
      render :index
    end
  end

end
