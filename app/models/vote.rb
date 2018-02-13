class Vote < ApplicationRecord
  auditable
  scorable
  preservable

  belongs_to :user

  validates_presence_of :user, :votable

end
