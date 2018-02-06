module CommentModule
  extend ActiveSupport::Concern

  def comment
    Rails.logger.info "entered in comment"
    puts "yo"
    if current_user
      hash = comment_params
      puts hash
      hash[:user_id] = current_user.id
      user_comment = commentable.comments.build(hash)
      if user_comment.save!
        render json: { success: true, message: "comment created"}, status: :ok
      else
        render json: { success: false, message: "Unable to create comment", errors: user_comment.errors }, status: :ok
      end
    else
      render json: { success: false, message: "You need to be logged in to post a comment"}, status: :ok
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:text)
    end
end