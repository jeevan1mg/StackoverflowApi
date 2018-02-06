class Api::V1::AnswersController < ApplicationController
  include CommentModule

  def create
    if current_user
      answer = question.answers.build(answer_params)
      answer.user = current_user
      if answer.save!
        render json: { success: true, message: "Answer submitted"}, status: :ok
      else
        render json: { success: false, message: "Unable to submit answer", errors: question.errors }, status: :ok
      end
    else
      render json: { success: false, message: "You need to be logged in to post an answer"}, status: :ok
    end
  end

  def show
    render json: answer
  end

  private
  def answer_params
    params.require(:answer).permit(:text)
  end

  def commentable
    Answer.find(params[:answer_id])
  end

  def question
    Question.find(params[:question_id])
  end

  def answer
    Answer.find(params[:id])
  end

end
