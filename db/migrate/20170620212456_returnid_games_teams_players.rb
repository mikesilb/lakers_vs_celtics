class ReturnidGamesTeamsPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :game_id, :integer
    add_column :images, :game_id, :integer
    add_column :videos, :game_id, :integer
    add_column :reviews, :team_id, :integer
    add_column :images, :team_id, :integer
    add_column :videos, :team_id, :integer
    add_column :reviews, :player_id, :integer
    add_column :images, :player_id, :integer
    add_column :videos, :player_id, :integer
  end
end
