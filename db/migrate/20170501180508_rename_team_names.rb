class RenameTeamNames < ActiveRecord::Migration[5.0]
  def change
    rename_table :nba_finals, :nbafinals
  end
end
