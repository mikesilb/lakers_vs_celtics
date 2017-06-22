class RemoveforeignkeysGamesTeamsPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :game, index: true
    remove_reference :images, :game, index: true
    remove_reference :videos, :game, index: true
    remove_reference :reviews, :team, index: true
    remove_reference :images, :team, index: true
    remove_reference :videos, :team, index: true
    remove_reference :reviews, :player, index: true
    remove_reference :images, :player, index: true
    remove_reference :videos, :player, index: true
  end
end
