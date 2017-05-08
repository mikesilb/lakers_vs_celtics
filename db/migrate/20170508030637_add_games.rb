class AddGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.date :date
      t.string :score, null: false

      t.belongs_to :nbafinal

      t.timestamps
    end
  end
end
