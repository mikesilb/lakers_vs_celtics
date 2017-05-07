class AddImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image, null: false

      t.belongs_to :user
      t.belongs_to :nbafinal
      t.timestamps
    end
  end
end
