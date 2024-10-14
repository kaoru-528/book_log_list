class Micropost < ApplicationRecord
  belongs_to :user
  # has_one_attached :image do |attachable|
  #   attachable.variant :display, resize_to_limit: [500, 500]
  # end
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
