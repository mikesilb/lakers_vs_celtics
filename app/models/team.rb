class Team < ApplicationRecord
  type_regex = /\A(?:(Lakers)|(Celtics))\Z/
  validates :teamname, presence: true, format: { with: type_regex }
  has_many :reviews
  has_many :images
  has_many :videos
  belongs_to :nbafinal
end
