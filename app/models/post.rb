class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :bike_genre
  belongs_to_active_hash :engine_capacity
  belongs_to_active_hash :prefecture

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :scheduled_date, presence: true
  validate :scheduled_date_cannot_be_in_the_past
  validates :bike_genre_id, presence: true
  validates :engine_capacity_id, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :prefecture_id, presence: true,  numericality: { only_integer: true, greater_than: 0 }
  validates :note, length: { maximum: 100 }
  private

  def scheduled_date_cannot_be_in_the_past
    if scheduled_date.present? && scheduled_date < Date.today
      errors.add(:scheduled_date, "予定日は今日以降の日付を選択してください")
    end
  end
end
