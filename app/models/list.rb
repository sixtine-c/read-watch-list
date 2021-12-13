class List < ApplicationRecord
  belongs_to :category
  has_many :bookmarks, dependent: :destroy
  has_many :items, through: :bookmarks
  has_one_attached :photo

  after_create :create_photo

  require 'open-uri'

  def create_photo
    unless photo.attached?
      file = URI.open('https://source.unsplash.com/collection/332024/1600x900')
      photo.attach(io: file, filename: 'photo.jpg', content_type: 'image/jpg')
    end
  end
end
