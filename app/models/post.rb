class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :body, length: { maximum: 65535 }
  validates :date, presence: true
end
