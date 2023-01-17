class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :body, length: { maximum: 65535 }
  validates :date, presence: true
end
