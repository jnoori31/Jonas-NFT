class Chatroom < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  belongs_to :client, :class_name => 'User'
  has_many :messages
end
