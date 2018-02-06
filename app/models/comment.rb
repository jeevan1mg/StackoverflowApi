class Comment < ApplicationRecord
  auditable
  scorable
  hard_deletable
  soft_deletable

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates_presence_of    :user, :commentable, :text

end
