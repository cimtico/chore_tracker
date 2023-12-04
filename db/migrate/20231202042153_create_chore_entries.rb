class CreateChoreEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :chore_entries do |t|
      t.references :chore, null: false, foreign_key: true
      t.datetime :date
      t.boolean :completed
      t.integer :value

      t.timestamps
    end
  end
end
