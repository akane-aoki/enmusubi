class Meet < ApplicationRecord
  belongs_to :relationship

  validates :meet_day, presence: true
end
