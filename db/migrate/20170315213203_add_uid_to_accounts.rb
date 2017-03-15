class AddUidToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :uid, :string
  end
end
