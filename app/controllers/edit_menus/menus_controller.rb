class EditMenus::MenusController < EditMenusController

  before_action :set_menu, only: [:edit, :update]

  def update
    @menu.update_attribute(:title, menu_params[:title])
    redirect_to edit_menus_area_path(@area)
  end


  private


  def menu_params
    params.require(:menu).permit(:title)
  end

end
