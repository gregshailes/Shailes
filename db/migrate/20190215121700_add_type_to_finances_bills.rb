class AddTypeToFinancesBills < ActiveRecord::Migration[6.1]
  def change
    add_column :finances_bills, :type, :string
  end
end
