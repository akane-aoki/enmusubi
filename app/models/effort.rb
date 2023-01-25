class Effort < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, uniqueness: true
end
