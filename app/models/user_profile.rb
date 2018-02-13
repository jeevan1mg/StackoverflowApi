class UserProfile < ApplicationRecord
  auditable
  preservable

  belongs_to :user
  has_and_belongs_to_many :tags

  validates  :user,             presence: true,             uniqueness: true
end
