class Review < ApplicationRecord
  RATINGS = [
    ["", ""],
    [1, "1"],
    [2, "2"],
    [3, "3"],
    [4, "4"],
    [5, "5"]
  ].freeze
  validates :rating, presence: true,
  numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :body, presence: true

  belongs_to :nbafinal
  belongs_to :user
end
