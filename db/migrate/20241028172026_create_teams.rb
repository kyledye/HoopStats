class CreateTeams < ActiveRecord::Migration[7.1]
  def change
    create_table :teams do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :abbreviation, null: true, default: nil
      t.boolean :is_opponent, default: false
      t.string :primary_color, null: true, default: nil
      t.string :secondary_color, null: true, default: nil
      t.boolean :active, default: true
      t.integer :sort_order, default: 9999

      t.timestamps
    end
  end
end
