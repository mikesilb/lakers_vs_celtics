class AddForeignkeysTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :team_id, :integer
    add_column :images, :team_id, :integer
    add_column :videos, :team_id, :integer
    add_foreign_key :reviews, :teams
    add_foreign_key :images, :teams
    add_foreign_key :videos, :teams
  end
end
