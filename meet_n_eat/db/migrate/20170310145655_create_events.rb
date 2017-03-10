class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.decimal :budget
      t.string :location
      t.string :cuisine
      t.time :time
      t.integer :host_id

      t.timestamps
    end
  end
end
