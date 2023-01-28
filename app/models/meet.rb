class Meet < ApplicationRecord
  belongs_to :relationship

  validates :meet_day, presence: true

  enum status: { attended_to_meet: 0, met_not: 1, met: 2 }

  # def next_meet
  #   current_user.relation.meet_day
  # end
end