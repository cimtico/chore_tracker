class CreateChores < ActiveRecord::Migration[7.1]
  def change
    create_table :chores do |t|
      t.string :name
      t.string :description
      t.integer :value

      t.timestamps
    end
  end
end
