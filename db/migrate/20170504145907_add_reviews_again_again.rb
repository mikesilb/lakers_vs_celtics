class AddReviewsAgainAgain < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body, null: false

      t.belongs_to :user
      t.belongs_to :nbafinal
      t.timestamps
    end
  end
end
