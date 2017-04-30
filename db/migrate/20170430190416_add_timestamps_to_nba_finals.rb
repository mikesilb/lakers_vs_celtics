class AddTimestampsToNbaFinals < ActiveRecord::Migration[5.0]
  def change
    add_column(:nba_finals, :created_at, :datetime)
    add_column(:nba_finals, :updated_at, :datetime)
  end
end
