class CreateTeamLevels < ActiveRecord::Migration[7.1]
  def change
    create_table :team_levels do |t|
      t.string :name
      t.string :abbreviation
      t.boolean :active, default: true
      t.integer :sort_order, default: 99

      t.timestamps
    end
    add_index :team_levels, :name, unique: true
    add_index :team_levels, :abbreviation, unique: true
  end
end
