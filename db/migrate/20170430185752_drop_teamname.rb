class DropTeamname < ActiveRecord::Migration[5.0]
  def change
    drop_table :team_name
  end
end
