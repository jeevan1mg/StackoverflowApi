class AnswerSerializer < ActiveModel::Serializer
  has_many :comments, as: :commentable
  attributes :id, :text, :user_id, :comments
end
