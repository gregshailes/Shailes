class CreateFinancesPots < ActiveRecord::Migration[6.1]
  def change
    create_table :finances_pots do |t|

      t.belongs_to :account, index: true
      t.monetize :amount, null: false

      t.timestamps
    end
  end
end
