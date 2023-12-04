class CreateChildren < ActiveRecord::Migration[7.1]
  def change
    create_table :children do |t|
      t.string :name
      t.datetime :last_cutoff_at
      t.integer :cutoff_amount

      t.timestamps
    end
  end
end
