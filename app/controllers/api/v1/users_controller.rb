class Api::V1::UsersController < ApplicationController

  def show
    render json: {user: UserSerializer.new(user)}
  end

  def create
    user = User.new(user_params)
    user.build_user_profile(user_profile_params)
    if user.save
      render json:  {success: true, message: "User Created", params: params}, status: :ok
    else
      render json:  {success: false, message: "User Creation Failed", user: user}, status: :ok
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

    def user_profile_params
      params.require(:user).permit(:full_name)
    end

    def user
      User.find(params[:id])
    end
end
