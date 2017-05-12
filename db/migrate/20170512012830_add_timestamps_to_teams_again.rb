class AddTimestampsToTeamsAgain < ActiveRecord::Migration[5.0]
  def change
    add_column(:teams, :created_at, :datetime)
    add_column(:teams, :updated_at, :datetime)
  end
end
