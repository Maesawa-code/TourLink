class EngineCapacity < ActiveHash::Base
  self.data = [
    { id: 1, name: '〜50cc' },
    { id: 2, name: '51〜125cc' },
    { id: 3, name: '126〜250cc' },
    { id: 4, name: '251〜400cc' },
    { id: 5, name: '401cc〜' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
