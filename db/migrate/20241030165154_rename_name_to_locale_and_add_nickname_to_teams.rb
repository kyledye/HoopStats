class RenameNameToLocaleAndAddNicknameToTeams < ActiveRecord::Migration[7.1]
  def change
    rename_column :teams, :name, :locale
    add_column :teams, :nickname, :string
  end
end
