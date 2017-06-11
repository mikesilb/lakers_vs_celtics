class AddForeignkeysPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :player_id, :integer
    add_column :images, :player_id, :integer
    add_column :videos, :player_id, :integer
    add_foreign_key :reviews, :players
    add_foreign_key :images, :players
    add_foreign_key :videos, :players
  end
end
