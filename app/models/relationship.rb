class Relationship < ApplicationRecord
  has_many :users
  has_one :meet, dependent: :destroy
  has_one :reward, dependent: :destroy

end