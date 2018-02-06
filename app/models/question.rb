class Question < ApplicationRecord
  auditable
  commentable
  votable
  hard_deletable
  soft_deletable

  belongs_to :user
  has_many   :answers
  has_and_belongs_to_many :tags

  validates_presence_of :user, :text, :title
  validates_length_of   :text, in: 0..500
  validates_length_of   :title, in: 0..100


end
