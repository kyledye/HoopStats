class CreatePlayActions < ActiveRecord::Migration[7.1]
  def change
    create_table :play_actions do |t|
      t.references :play_action_group, null: false, foreign_key: true
      t.string :name
      t.integer :points, default: 0
      t.boolean :requires_coordinates, default: false
      t.boolean :requires_fouls, default: false
      t.boolean :requires_substitutions, default: false
      t.string :style, null: true, default: nil
      t.boolean :active, default: true
      t.integer :sort_order, default: 999

      t.timestamps
    end
  end
end
