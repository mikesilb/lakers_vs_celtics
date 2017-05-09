class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :video, null: false

      t.belongs_to :user
      t.belongs_to :nbafinal
      t.timestamps
    end
  end
end
