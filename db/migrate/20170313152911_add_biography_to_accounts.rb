class AddBiographyToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :biography, :text
    add_column :accounts, :favorite_food, :text
  end
end
