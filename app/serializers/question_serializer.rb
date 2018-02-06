class QuestionSerializer < ActiveModel::Serializer
  has_many :comments, as: :commentable
  has_many :answers
  attributes :id, :title, :text, :answers, :comments

end
