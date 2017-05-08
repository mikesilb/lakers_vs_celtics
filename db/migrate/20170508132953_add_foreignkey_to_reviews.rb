class AddForeignkeyToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :game_id, :integer
    add_column :images, :game_id, :integer
    add_column :videos, :game_id, :integer
    add_foreign_key :reviews, :games
    add_foreign_key :images, :games
    add_foreign_key :videos, :games
  end
end
