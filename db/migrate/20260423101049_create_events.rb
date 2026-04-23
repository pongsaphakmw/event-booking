class CreateEvents < ActiveRecord::Migration[8.1]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_at
      t.integer :remaining_tickets

      t.timestamps
    end
  end
end
