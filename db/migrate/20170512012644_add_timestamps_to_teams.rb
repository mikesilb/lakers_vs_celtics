class AddTimestampsToTeams < ActiveRecord::Migration[5.0]
  def change
    def change_table
      add_timestamps(:teams)
    end
  end
end
