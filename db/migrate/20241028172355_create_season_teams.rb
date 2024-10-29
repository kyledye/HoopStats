class CreateSeasonTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :season_teams do |t|
      t.references :season, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
