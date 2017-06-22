class Returnforeignkeys < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :nbafinal, index: true
    add_reference :images, :nbafinal, index: true
    add_reference :videos, :nbafinal, index: true
  end
end
