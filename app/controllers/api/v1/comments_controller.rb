class Api::V1::CommentsController < ApplicationController

  before_action   :user_logged_in?, :create

  def create
    if current_user
      comment_params[:user_id] = current_user.id
      comment = commentable.comments.build(comment_params)
      if comment.save!
        render json: { success: true, message: "comment created"}, status: :ok
      else
        render json: { success: false, message: "Unable to create comment", errors: comment.errors }, status: :ok
      end
    else
      render json: { success: false, message: "You need to be logged in to post a comment"}, status: :ok
    end
  end

  private
    def comment_params
      params.require(:comment).permit( :text, :commentable_id, :commentable_type)
    end
end
