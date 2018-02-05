class Api::V1::QuestionsController < ApplicationController

  before_action   :user_logged_in?, :create

  def create
    if current_user
      question = current_user.questions.build(question_params)
      if question.save!
        render json: { success: true, message: "Question created"}, status: :ok
      else
        render json: { success: false, message: "Unable to create question", errors: question.errors }, status: :ok
      end
    else
      render json: { success: false, message: "You need to be logged in to post this question"}, status: :ok
    end
  end

  private
    def question_params
      params.require(:question).permit(:title,:text)
    end
end
