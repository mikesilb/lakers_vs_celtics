class Team_name < ApplicationRecord
  validates :team, presence: true, uniqueness: true
end
