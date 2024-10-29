class CreateTeammates < ActiveRecord::Migration[7.1]
  def change
    create_table :teammates do |t|
      t.references :season_team, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.integer :jersey_number, null: true, default: nil
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
