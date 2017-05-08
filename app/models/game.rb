class Game < ApplicationRecord
  validates :score, presence: true
  has_many :reviews
  has_many :images
  has_many :videos
  belongs_to :nbafinal
end
