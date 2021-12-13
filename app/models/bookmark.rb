class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :item
  has_many :bookmark_tags
end
