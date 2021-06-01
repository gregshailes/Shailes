class EditMenus::MenuItemsController < EditMenusController

  before_action :set_item

  def update
    @item.update_columns(caption: item_params[:caption], url: item_params[:url])
    redirect_to edit_edit_menus_area_menu_path(@area, @menu)
  end


  private


  def item_params
    params.require(:menu_item).permit(:caption, :url)
  end

end
