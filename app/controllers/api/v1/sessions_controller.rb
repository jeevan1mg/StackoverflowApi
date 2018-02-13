class Api::V1::SessionsController < ApplicationController
  before_action  :user_logged_in? , only:[:destroy]

  def create
    user = User.where(email: params[:session][:email]).first
    if user and UserAuthenticator.new(user).authenticate(params[:session][:password])
      sign_in user
      render json: { success: true, message: 'Login Successful', auth_token: @session.auth_token }, status: :ok
    else
      render json: { success: false, message: 'Invalid Credentials' }, status: :ok
    end
  end

  def destroy
    if sign_out
      render json: { success: true, message: 'Signout Successful' }, status: :ok
    else
      render json: { success: false, message: 'Invalid Request' }, status: :ok
    end
  end

  def sign_in(user)
    @session = Session.new(user_id: user.id)
    @session.save
  end

  def sign_out
    current_session.expire
    current_session.save!
  end
end
