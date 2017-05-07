class Video < ApplicationRecord
  validates :video, presence: true

  belongs_to :nbafinal
  belongs_to :user
end
