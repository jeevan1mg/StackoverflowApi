class Api::V1::QuestionsController < ApplicationController

  before_action  :user_logged_in? , only:[:create]

  def index
    if params[:user_id]
      render json: Question.where(user_id: params[:user_id])
    else
      render json: Question.all
    end
  end

  def create
    if current_user
      question = current_user.questions.build(question_params)
      question.tags = tags
      question.save!
      render json: { success: true, message: "Question created"}, status: :ok
    else
      render json: { success: false, message: "You need to be logged in to post this question"}, status: :ok
    end
  end

  def show
    render json: question
  end

  private

  def question_params
    params.require(:question).permit( :title, :text)
  end

  def tags
    Tag.where(name: params[:question][:tags])
  end

  def question
    Question.find(params[:id])
  end

end
