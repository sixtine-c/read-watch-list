class Category < ApplicationRecord
  has_many :items
  has_many :lists, dependent: :destroy
  has_one_attached :photo
end
