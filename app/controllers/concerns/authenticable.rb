module Authenticable
  def current_user
    @current_user ||= current_session.user if current_session
  end

  def current_session
    @current_session ||= Session.find_by(auth_token: request.headers['Authorization'])
  end

  def user_logged_in?
    unless current_user
      render json: { success: false, message: "You need to be logged in to take this action"}, status: :ok
    end
  end
end