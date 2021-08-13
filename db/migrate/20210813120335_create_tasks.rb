class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :task_owner, polymorphic: true, index: true
      t.string :name, nil: false
      t.integer :status, nil: false, default: 0
      t.timestamps
    end
  end
end
