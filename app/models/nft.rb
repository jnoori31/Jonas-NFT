class Nft < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :category, presence: true, inclusion: { in: %w(Music Art Sport Cinema) }
end

# we want users to return users NFT's
