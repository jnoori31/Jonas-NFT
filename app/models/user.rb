class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_favoritor
  has_many :comments
  has_many :nfts
  include PgSearch::Model
  pg_search_scope :search_by_first_and_last_name,
  against: [:first_name, :last_name],
  using: {
    tsearch: { prefix: true }
  }
end
