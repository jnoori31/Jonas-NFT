class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_favoritor
  acts_as_favoritable

  # notifications
  has_many :notifications
  has_many :comments
  has_many :nfts
  has_many :nft_comments, through: :nfts, source: :comments
  has_many :incoming_notifications, through: :nft_comments, source: :notification
  has_one_attached :avatar


  include PgSearch::Model
  pg_search_scope :search_by_first_and_last_name,
  against: [:first_name, :last_name],
  using: {
    tsearch: { prefix: true }
  }

  def mark_notications_as_seen_for_nft(nft_id)
    Comment.where(nft_id: nft_id, user_id: self.id).each do |comment|
      comment.notification.update(seen: true)
    end
  end
end
