class CreateMenuAreas < ActiveRecord::Migration[6.1]

  class LocalMenuArea < ActiveRecord::Base
    self.table_name = 'menu_areas'
  end

  def change
    create_table :menu_areas do |t|
      t.string :description, nil: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        LocalMenuArea.create(description: 'Personal')        
        LocalMenuArea.create(description: 'Work')        
      end
    end

  end

end
