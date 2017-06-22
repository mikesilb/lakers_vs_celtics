class Dropforeignkeys < ActiveRecord::Migration[5.0]
  def change
    remove_reference :reviews, :nbafinal, index: true
    remove_reference :images, :nbafinal, index: true
    remove_reference :videos, :nbafinal, index: true
  end
end
