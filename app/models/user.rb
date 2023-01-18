class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy
  belongs_to :relationship
  has_one :invitation, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :efforts, dependent: :destroy

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 15 }
  validates :email, uniqueness: true, presence: true

  def own?(object)
    id == object.user_id
  end
end
