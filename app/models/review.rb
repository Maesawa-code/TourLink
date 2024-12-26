class Review < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 100 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, length: { maximum: 100 }
  validates :image, presence: true
end