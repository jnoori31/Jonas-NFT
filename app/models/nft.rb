class Nft < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :category, presence: true, inclusion: { in: %w(music art sport collectibles) }
  acts_as_favoritable

  def mark_notifications_as_seen
    comments = self.comments
    comments.each do |comment|
      comment.notification.update(seen: true)
    end 
  end
end

# we want users to return users NFT's
