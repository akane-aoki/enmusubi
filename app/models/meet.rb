class Meet < ApplicationRecord
  belongs_to :relationship

  validates :meet_day_start, presence: true

  enum status: { attended_to_meet: 0, met_not: 1, met: 2 }

  def next_meet
    current_user.relation.meet_day_start
  end

  def self.meets_all(user)
    Meet.where(relationship_id: user.relationship_id).order(meet_day_start: :desc)
  end
end