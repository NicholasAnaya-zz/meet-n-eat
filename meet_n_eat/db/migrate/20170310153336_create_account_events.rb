class CreateAccountEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :account_events do |t|
      t.integer :account_id
      t.integer :event_id

      t.timestamps
    end
  end
end
