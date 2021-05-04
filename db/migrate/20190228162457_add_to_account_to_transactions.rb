class AddToAccountToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :finances_transactions, :to_account_id, :integer, index: true
  end
end
