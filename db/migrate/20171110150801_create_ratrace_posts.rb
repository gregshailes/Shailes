class CreateRatracePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :ratrace_posts do |t|
      t.string :title
      t.text   :body
      t.timestamps
      t.belongs_to :user, index: true
    end
  end
end
