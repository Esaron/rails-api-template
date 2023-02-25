class ApplicationController < ActionController::API
  include JwtAuthenticatable

  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split&.last
    return head :unauthorized unless token.present?

    begin
      @decoded = jwt_decode(token)
      @current_user = User.find(@decoded[:user_id])
    rescue
      head :unauthorized
    end
  end
end
