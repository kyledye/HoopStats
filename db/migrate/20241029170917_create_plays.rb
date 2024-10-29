class CreatePlays < ActiveRecord::Migration[7.1]
  def change
    create_table :plays do |t|
      t.references :game, null: false, foreign_key: true
      t.references :period, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :play_action, null: false, foreign_key: true
      t.references :player, null: true, default: nil, foreign_key: true
      t.references :foul, null: true, default: nil, foreign_key: true
      t.integer :game_clock, null: true, default: nil
      t.integer :sort_order
      t.references :shot_grade, null: true, default: nil, foreign_key: true
      t.references :shot_type, null: true, default: nil, foreign_key: true
      t.decimal :x_coordinate, precision: 16, scale: 10, null: true, default: nil
      t.decimal :y_coordinate, precision: 16, scale: 10, null: true, default: nil
      t.decimal :canvas_height, precision: 16, scale: 10, null: true, default: nil
      t.decimal :canvas_width, precision: 16, scale: 10, null: true, default: nil

      t.timestamps
    end
  end
end
