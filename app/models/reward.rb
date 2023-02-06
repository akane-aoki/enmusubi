class Reward < ApplicationRecord
  belongs_to :relationship

  validates :not_meet_day, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: 1000 }
  validates :content, presence: true
end
