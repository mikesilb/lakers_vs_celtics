class CreateNbafinals < ActiveRecord::Migration[5.0]
  def change
    create_table :nbafinals do |t|
      t.integer :year, null: false
      t.integer :numgames, null: false
      t.string :champion, null: false
      t.string :mvp

      t.timestamps
    end
  end
end
