class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  validates :title, length: {minimum: 5, maximum: 60}
  validates :content, length: {minimum: 10}
  mount_uploader :image, ImageUploader
end
