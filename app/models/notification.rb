class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :comment


# scope for notification unseen (we call it unseen_notifications because they are not seen)
  scope :unseen_notifications, -> { where(seen: false) }
end
