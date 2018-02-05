module Authenticable
  def current_user
    @current_user ||= current_session.user
  end

  def current_session
    @current_session ||= Session.find_by(auth_token: request.headers['Authorization'])
  end
end