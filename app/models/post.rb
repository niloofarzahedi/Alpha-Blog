class Post < ApplicationRecord
  include Notifications

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many_attached :media
  has_rich_text :description
  validates :content, presence: true
  validates :inventory_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
