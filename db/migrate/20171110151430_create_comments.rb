class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.string :comment
      t.references :commentable, polymorphic: true
      t.timestamps null: false
    end
  end
end
