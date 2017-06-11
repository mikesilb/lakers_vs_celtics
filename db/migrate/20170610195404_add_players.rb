class AddPlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.belongs_to :team
      t.string :lastname, null: false
      t.string :firstname, null: false
      t.timestamps
    end
  end
end
