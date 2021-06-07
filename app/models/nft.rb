class Nft < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
end

# we want users to return users NFT's
