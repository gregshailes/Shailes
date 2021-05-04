class AddReconciledBalanceToFinancesAccounts < ActiveRecord::Migration[6.1]
  def change
    add_monetize :finances_accounts, :reconciled_balance, amount: { null: true, default: nil }
  end
end
