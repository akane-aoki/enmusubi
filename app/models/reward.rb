class Reward < ApplicationRecord
  belongs_to :relationship

  validates :not_meet_day, presence: true
  validates :content, presence: true
end
