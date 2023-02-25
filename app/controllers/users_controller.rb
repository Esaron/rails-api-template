class UsersController < ApplicationController
  include CrudController

  private

  def resource_params
    params.permit(:user_name, :email, :name, :password, :password_confirmation)
  end
end
