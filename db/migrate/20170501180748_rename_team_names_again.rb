class RenameTeamNamesAgain < ActiveRecord::Migration[5.0]
  def change
    rename_table :team_names, :teamnames
  end
end
