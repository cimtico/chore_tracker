class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.string :name
      t.string :description
      t.integer :value
      t.date :date

      t.timestamps
    end
  end
end
