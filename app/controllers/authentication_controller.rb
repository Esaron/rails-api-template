class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user

  def login
    @user = User.find_by(user_name: params[:user_name])
    return head :unauthorized unless @user.present?

    if @user.authenticate(params[:password])
      exp = 24.hours.from_now
      token = jwt_encode({ user_id: @user.id }, exp:)
      render json: { token: token, exp:, user_name: @user.user_name}
    else
      head :unauthorized
    end
  end
end
