class Api::V1::CommentsController < ApplicationController

  before_action  :user_logged_in? , only:[:create]

  def create
    comment = commentable.comments.build(comment_params)
    comment.user = current_user
    comment.save!
    render json: { success: true, message: "comment created"}, status: :ok
  end

  def show
    render json: comment, status: :ok
  end

  def index
    render json: comments
  end

  private

  def comment_params
    params.require(:comment).permit( :text)
  end

  def commentable
    model.find(params[model_key])
  end

  def model
    model_key.match(/(.+)_id/)[1].camelcase.constantize
  end

  def model_key
    params.keys.select{ |k| k.match(/_id/)}.first
  end

  def comment
    Comment.find(params[:id])
  end

  def comments
    if model_key and commentable
      commentable.comments
    else
      Comment.all
    end
  end
end
