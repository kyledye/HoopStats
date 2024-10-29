class CreatePeriods < ActiveRecord::Migration[7.1]
  def change
    create_table :periods do |t|
      t.string :name
      t.boolean :is_overtime, default: false
      t.boolean :active, default: true
      t.integer :sort_order, default: 999

      t.timestamps
    end
    add_index :periods, :name, unique: true
  end
end
