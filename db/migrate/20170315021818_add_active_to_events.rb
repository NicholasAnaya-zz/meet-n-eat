class AddActiveToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :active, :boolean
  end
end
