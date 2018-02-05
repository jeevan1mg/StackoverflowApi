class Vote < ApplicationRecord
  auditable
  scorable
  hard_deletable
  soft_deletable

  belongs_to :user

  validates_presence_of :user, :votable

end
