class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  # rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  before_action:authorize

  private

  def record_invalid(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end

  def authorize
  @current_user= User.find_by(id: session[:user_id])
  render json: { error: "Not authorized" }, status: 401 unless @current_user
  end
  # def render_not_found_response
  #   render json: { error: "Bird not found" }, status: :not_found
  # end

end
