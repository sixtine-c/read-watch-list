class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :item
  has_many :bookmark_tags
  has_one_attached :photo
  # validates :comment, length: { minimum: 6 }
end
