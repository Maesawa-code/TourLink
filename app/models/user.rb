class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :age_group
  has_one_attached :profile_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: { message: "名前を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }
  validates :profile_image, presence: { message: "画像を選択してください" }
  validates :age_group_id, presence: true, numericality: { only_integer: true, greater_than: 0, message: "年齢を選択してください" }
  validates :gender_id, presence: true, numericality: { only_integer: true, greater_than: 0, message: "性別を選択してください" }
  validates :password, presence: true, format: { 
    with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, 
    message: "パスワードは英字と数字を含む必要があります" 
  }

  def was_attached?
    self.image.attached?
  end
end
