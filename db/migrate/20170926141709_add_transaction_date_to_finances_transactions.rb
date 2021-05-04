class AddTransactionDateToFinancesTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :finances_transactions, :transaction_date, :date
  end
end
