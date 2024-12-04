class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :profile_image, presence: true
  validates :age_group_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :gender_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }


  has_one_attached :image
end
