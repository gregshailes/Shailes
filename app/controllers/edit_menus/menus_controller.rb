class EditMenus::MenusController < EditMenusController

  before_action :set_menu, only: [:edit, :update, :destroy]
  before_action :set_area, only: [:new, :create]

  def update
    @menu.update_attribute(:title, menu_params[:title])
    redirect_to edit_menus_area_path(@area)
  end

  def destroy
    if @menu.destroy!
      redirect_to edit_menus_area_path(@area) 
    end
  end

  def new
    @menu = Menu.new(menu_area: @area)
  end

  def create
    @menu = Menu.new(menu_area: @area)
    @menu.title = menu_params[:title]
    if @menu.save!
      redirect_to edit_menus_area_path(@area) 
    end
  end

  private


  def menu_params
    params.require(:menu).permit(:title)
  end

end
