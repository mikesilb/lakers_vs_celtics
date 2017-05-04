class Nbafinal < ApplicationRecord
  type_regex = /\A(?:(Lakers)|(Celtics))\Z/
  validates :year, presence: true, uniqueness: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 1959, less_than_or_equal_to: 2010 }
  validates :numgames, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 4, less_than_or_equal_to: 7 }
  validates :champion, presence: true, format: { with: type_regex }
end
