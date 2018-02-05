class Comment < ApplicationRecord
  auditable
  scorable
  hard_deletable
  soft_deletable

  belongs_to :commentable, polymorphic: true, counter_cache: true
  belongs_to :user,        counter_cache: true

  validates_presence_of    :user, :commentable, :text

end
