class AddImageColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :nbafinals, :image, :string
  end
end
