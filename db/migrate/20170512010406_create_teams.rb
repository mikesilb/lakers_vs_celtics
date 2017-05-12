class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :teamname, null: false
      t.belongs_to :nbafinal
    end
  end
end
