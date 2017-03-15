class AddColumnsToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :provider, :string
  end
end
