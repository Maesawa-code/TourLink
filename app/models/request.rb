class Request < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :status, presence: true, inclusion: { in: %w[pending approved rejected] }
end
