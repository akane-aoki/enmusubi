class Meet < ApplicationRecord
  belongs_to :relationship

  validates :meet_day_start, presence: true

  enum status: { attended_to_meet: 0, met_not: 1, met: 2 }

  def self.meets_all(user)
    Meet.where(relationship_id: user.relationship_id).order(meet_day_start: :desc)
  end

  def self.next_meet_after_today(user)
    @meet_first && @meet_first.meet_day_start && @meet_first.meet_day_start >= @today
  end

  def self.meets_include_meet_first(user)
    @meets_all = Meet.meets_all(user)
    @meet_first = Meet.meets_all(user).limit(1).first
    @today = Date.current
    @meets_all && @meet_first && @meet_first.meet_day_start && @meet_first.meet_day_start < @today
  end

  def self.meets_except_meet_first(user)
    @meets_all = Meet.meets_all(user)
    @meet_first = Meet.meets_all(user).limit(1).first
    @meets_all && @meets_all.length >= 1
  end

  def self.meets_arr(user)
    Meet.where(relationship_id: user.relationship_id).order(meet_day_start: :desc).pluck(:meet_day_start)
  end

  def self.meet_second_include_meet_day_end(user)
    Meet.where(relationship_id: user.relationship_id).order(meet_day_end: :desc).pluck(:meet_day_end).second
  end

  def self.meet_second_only_meet_day_start(user)
    Meet.where(relationship_id: user.relationship_id).order(meet_day_start: :desc).pluck(:meet_day_start).second
  end
end