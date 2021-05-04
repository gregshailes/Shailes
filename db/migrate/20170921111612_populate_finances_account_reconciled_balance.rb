class PopulateFinancesAccountReconciledBalance < ActiveRecord::Migration[6.1]

  class LocalAccount < ActiveRecord::Base
    self.table_name = 'finances_accounts'
  end

  class LocalTransaction < ActiveRecord::Base
    self.table_name = 'finances_transactions'
  end

  def up
    LocalAccount.all.each do |account|
      sum = LocalTransaction.where(account_id: account.id, reconciled: true).sum(:amount_pence)
      account.update(reconciled_balance_pence: sum)
    end
  end

  def down

  end
end
