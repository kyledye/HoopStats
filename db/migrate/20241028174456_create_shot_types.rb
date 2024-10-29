class CreateShotTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :shot_types do |t|
      t.string :name
      t.boolean :active, default: true
      t.integer :sort_order, default: 9999

      t.timestamps
    end
    add_index :shot_types, :name, unique: true
  end
end
