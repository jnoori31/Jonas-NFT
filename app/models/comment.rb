class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :nft
  validates :contents, presence: true
end
