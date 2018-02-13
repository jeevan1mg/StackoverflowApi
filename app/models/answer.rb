class Answer < ApplicationRecord
  auditable
  commentable
  votable
  scorable
  preservable

  belongs_to :user
  belongs_to :question

  validates_presence_of :user, :text, :question
  validates_length_of   :text, in: 0..500

end
