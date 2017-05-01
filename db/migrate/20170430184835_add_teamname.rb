class AddTeamname < ActiveRecord::Migration[5.0]
  def change
    create_table :team_name do |t|
      t.string :team, null: false
    end
  end
end
