class EditMenus::MenuItemsController < EditMenusController

  before_action :set_item, only: [:edit, :update, :destroy]
  before_action :set_menu, only: [:new, :create]

  def update
    @item.update_columns(caption: item_params[:caption], url: item_params[:url])
    redirect_to edit_edit_menus_area_menu_path(@area, @menu)
  end

  def destroy
    if @item.destroy!
      redirect_to edit_edit_menus_area_menu_path(@area, @menu) 
    end
  end

  def new
    @item = MenuItem.new(menu: @menu)
  end

  def create
    @item = MenuItem.new(menu: @menu)
    @item.caption = item_params[:caption]
    @item.url = item_params[:url]
    if @item.save!
      redirect_to edit_edit_menus_area_menu_path(@area, @menu) 
    end
  end


  private


  def item_params
    params.require(:menu_item).permit(:caption, :url)
  end

end
