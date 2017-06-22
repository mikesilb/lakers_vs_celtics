class Image < ApplicationRecord
  type_regex = /\A.+(\.tif)|(\.jpg)|(\.gif)|(\.png)\Z/
  validates :image, presence: true, format: { with: type_regex }
  
  belongs_to :user
end
