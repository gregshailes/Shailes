class CreateFinancesTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :finances_transactions do |t|
      t.belongs_to :account, index: true
      t.string :description
      t.monetize :amount
      t.boolean :reconciled
      t.timestamps null: false
    end
  end
end
