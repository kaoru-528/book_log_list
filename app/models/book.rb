class Book < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true
    validates :title, presence: true, length: { maximum: 140 }
    validates :author, presence: true, length: { maximum: 140 }
    validates :image, length: { maximum: 256 }
end
