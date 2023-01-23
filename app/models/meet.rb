class Meet < ApplicationRecord
  belongs_to :relationship

  validates :meet_day, presence: true

  enum status: { attended_to_meet: 0, not_met: 1, met: 2 }
end