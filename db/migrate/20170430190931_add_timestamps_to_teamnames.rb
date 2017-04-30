class AddTimestampsToTeamnames < ActiveRecord::Migration[5.0]
  def change
    add_column(:team_names, :created_at, :datetime)
    add_column(:team_names, :updated_at, :datetime)
  end
end
