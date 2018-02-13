module ErrorHandlers
  extend ActiveSupport::Concern

  def render_not_found(e)
    render json:  { success: false, message: e.message} , status: :not_found
  end

  def render_record_invalid(e)
    render json:  { success: false, message: e.message}, status: :bad_request
  end
end