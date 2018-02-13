class Api::V1::AnswersController < ApplicationController

  before_action  :user_logged_in? , only:[:create]

  def create
    if current_user
      answer = question.answers.build(answer_params)
      answer.user = current_user
      answer.save!
      render json: { success: true, message: "Answer submitted"}, status: :ok
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

  def question
    Question.find(params[:question_id])
  end

  def answer
    Answer.find(params[:id])
  end

end
