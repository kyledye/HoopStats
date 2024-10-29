class CreateFouls < ActiveRecord::Migration[7.1]
  def change
    create_table :fouls do |t|
      t.string :name
      t.text :description, null: true, default: nil
      t.boolean :is_technical, default: false
      t.boolean :active, default: true
      t.integer :sort_order, default: 999

      t.timestamps
    end
    add_index :fouls, :name, unique: true
  end
end
