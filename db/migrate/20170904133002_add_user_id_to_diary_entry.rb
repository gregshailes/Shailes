class AddUserIdToDiaryEntry < ActiveRecord::Migration[6.1]
  def change
    add_reference :diary_entries, :user, index: true
  end
end
