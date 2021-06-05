class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :nft
  validates :content, presence: true
end
