class Api::V1::UserProfilesController < ApplicationController

  def show
    render json: {user: UserProfileSerializer.new(user_profile)}
  end

  def create
    user_profile = UserProfile.new(user_profile_params)
    if user_profile.save
      render json:  {success: true, message: "User Created"}, status: :ok
    else
      render json:  {success: false, message: "User Creation Failed", user_profile: user_profile.errors}, status: :ok
    end
  end

  private
    def user_profile_params
      params.require(:user_profile).permit(:user_id ,:full_name)
    end

    def user_profile
      UserProfile.find_by(id: params[:id])
    end
end
