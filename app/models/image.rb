class Image < ApplicationRecord
  validates :image, presence: true

  belongs_to :nbafinal
  belongs_to :user
end
