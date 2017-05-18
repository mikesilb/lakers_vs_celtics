class Video < ApplicationRecord
  type_regex = /\A.+(www\.youtube\.com)|(www\.vimeo\.com)|(\.mov)|(\.mp4)|(\.wmv)|(\.mpg)|(\.mpeg)(\.m4v)|(\.flv)\Z/
  validates :video, presence: true, format: { with: type_regex }

  belongs_to :nbafinal
  belongs_to :user
end
