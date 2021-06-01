 class EditMenusController < ApplicationController

  before_action :authenticate_greg!

  def set_area
    @area = MenuArea.find(params[:area_id] || params[:id])
  end

  def set_menu
    set_area
    @menu = @area.menus.find(params[:menu_id] || params[:id])
  end

  def set_item
    set_menu
    @item = @menu.menu_items.find(params[:item_id] || params[:id])
  end

 end
