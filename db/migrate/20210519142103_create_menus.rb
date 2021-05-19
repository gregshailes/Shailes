class CreateMenus < ActiveRecord::Migration[6.1]
  class LocalMenuArea < ActiveRecord::Base
    self.table_name = 'menu_areas'
  end
  class LocalMenu < ActiveRecord::Base
    self.table_name = 'menus'
  end

  def change
    create_table :menus do |t|
      t.string :title, nil: false
      t.belongs_to :menu_area, nil: false
      t.integer :index, nil: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        home = LocalMenuArea.find_by(description: 'Personal')
        LocalMenu.create(menu_area_id: home.id, title: 'My Code', index: 1)
        LocalMenu.create(menu_area_id: home.id, title: 'Money', index: 2)
        LocalMenu.create(menu_area_id: home.id, title: 'Fitness', index: 3)
        LocalMenu.create(menu_area_id: home.id, title: 'Misc', index: 4)

        work = LocalMenuArea.find_by(description: 'Work')
        LocalMenu.create(menu_area_id: work.id, title: 'Coherent', index: 2)
        LocalMenu.create(menu_area_id: work.id, title: 'Coding', index: 3)
        LocalMenu.create(menu_area_id: work.id, title: 'Integrations', index: 4)
      end
    end

  end
end
