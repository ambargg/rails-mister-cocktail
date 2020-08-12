class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  mount_uploader :photo, PhotoUploader
  # has_many :reviews, dependent: :destroy
end

 # has_one_attached :photo
# has_many_attached :photos