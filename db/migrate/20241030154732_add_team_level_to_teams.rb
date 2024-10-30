class AddTeamLevelToTeams < ActiveRecord::Migration[7.1]
  def change
    add_reference :teams, :team_level, null: true, default: nil, foreign_key: true
  end
end
