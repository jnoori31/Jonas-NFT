class Nft < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :category, presence: true, inclusion: { in: %w(music art sport cinema) }
end
