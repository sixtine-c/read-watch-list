class Item < ApplicationRecord
  belongs_to :category
  has_many :bookmarks
  # validates :title, presence: true, uniqueness: true

  # include PgSearch::Model
  # pg_search_scope :search_by_title_and_synopsis,
  #   against: [ :title, :overview ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

end
