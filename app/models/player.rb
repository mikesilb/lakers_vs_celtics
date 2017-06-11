class Player < ApplicationRecord
  validates :lastname, presence: true
  validates :lastname, presence: true
  has_many :reviews
  has_many :images
  has_many :videos
  belongs_to :team
end
