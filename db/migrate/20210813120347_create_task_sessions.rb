class CreateTaskSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :task_sessions do |t|
      t.belongs_to :task, index: true
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
