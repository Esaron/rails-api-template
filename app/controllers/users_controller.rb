class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: 400
    end
  end

  def update
    @user.update!(user_params)
    render json: @user
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name)
  end
end
