class BikeGenre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ネイキッド' },
    { id: 2, name: 'スポーツバイク' },
    { id: 3, name: 'アメリカン/クルーザー' },
    { id: 4, name: 'オフロード' },
    { id: 5, name: 'ツアラー' },
    { id: 6, name: 'スクーター' },
    { id: 7, name: 'ミニバイク' },
    { id: 8, name: 'レトロ/クラシック' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
