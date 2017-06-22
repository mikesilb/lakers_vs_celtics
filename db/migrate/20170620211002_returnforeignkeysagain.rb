class Returnforeignkeysagain < ActiveRecord::Migration[5.0]
  def change
    def change
      add_column :reviews, :nbafinal_id, :integer
      add_column :images, :nbafinal_id, :integer
      add_column :videos, :nbafinal_id, :integer
    end
  end
end
