class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true

  # prevents a user from following another user more than once
  validates :follower_id, uniqueness: { scope: :followed_id }
end
