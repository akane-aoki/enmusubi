class Relationship < ApplicationRecord
  has_many :users
  has_one :meet, dependent: :destroy
  has_one :reward, dependent: :destroy

  validate :check_number_of_users

  def check_number_of_users
    if relationship && relationship.users.count > 2
    errors.add(:relation, "人数OVERです")
    end
  end
end