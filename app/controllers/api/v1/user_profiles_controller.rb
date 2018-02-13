class Api::V1::UserProfilesController < ApplicationController

  before_action  :user_logged_in? , only:[:create]

  def show
    render json: user_profile
  end

  def create
    user_profile = user.build_user_profile(user_profile_params)
    user_profile.save!
    render json:  {success: true, message: "User Created"}, status: :ok
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:full_name)
  end

  def user_profile
    UserProfile.find_by(id: params[:id])
  end

  def user
    User.find(params[:user_id])
  end

end
