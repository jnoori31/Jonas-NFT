class Nft < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :category, presence: true, inclusion: { in: %w(Music Art Sport Cinema) }
  acts_as_favoritable
end

# we want users to return users NFT's
