class UserProfile < ApplicationRecord
  auditable
  hard_deletable
  soft_deletable

  belongs_to :user
  has_and_belongs_to_many :tags

  validates  :user,             presence: true,             uniqueness: true
end
