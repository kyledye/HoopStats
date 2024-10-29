class CreateShotGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :shot_grades do |t|
      t.string :name
      t.text :description, null: true, default: nil
      t.decimal :made_multiplier, precision: 10, scale: 2
      t.decimal :missed_multiplier, precision: 10, scale: 2
      t.integer :score, default: 0
      t.boolean :active, default: true
      t.integer :sort_order, default: 9999

      t.timestamps
    end
    add_index :shot_grades, :name, unique: true
  end
end
