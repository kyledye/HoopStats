class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.references :season, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :opponent, foreign_key: { to_table: :teams }, null: false
      t.datetime :date_time, null: true, default: nil
      t.integer :number_of_periods, default: 4
      t.boolean :allow_overtime, default: true
      t.integer :period_length, default: 8
      t.integer :overtime_length, default: 4
      t.boolean :is_away, default: false
      t.boolean :is_closed, default: false
      t.json :current_lineup, null: true, default: nil
      t.boolean :counts_against_record, default: true

      t.timestamps
    end
  end
end
