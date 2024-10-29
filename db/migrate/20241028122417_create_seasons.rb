class CreateSeasons < ActiveRecord::Migration[7.1]
  def change
    create_table :seasons do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :slug
      t.date :start_date
      t.date :end_date
      t.integer :sort_order, default: 999
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :seasons, :slug, unique: true
  end
end
