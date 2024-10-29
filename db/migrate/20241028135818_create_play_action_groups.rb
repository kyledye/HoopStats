class CreatePlayActionGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :play_action_groups do |t|
      t.string :name
      t.boolean :is_pinned, default: false
      t.boolean :active, default: true
      t.integer :sort_order, default: 99

      t.timestamps
    end
    add_index :play_action_groups, :name, unique: true
  end
end
