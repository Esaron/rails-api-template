class Api::V1::ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :update, :destroy]

  def index
    @resources = Resource.all
    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      render json: @resource
    else
      render json: { errors: @resource.errors.full_messages }, status: 400
    end
  end

  def update
    @resource.update!(resource_params)
    render json: @resource
  end

  def destroy
    @resource.destroy!
    head :no_content
  end

  private

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def resource_params
    params.permit(:name)
  end
end
