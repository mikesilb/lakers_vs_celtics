class Teamname < ApplicationRecord
  validates :team, presence: true, uniqueness: true
end
