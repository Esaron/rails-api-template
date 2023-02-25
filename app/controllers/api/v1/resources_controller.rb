class Api::V1::ResourcesController < ApplicationController
  before_action :find_resource, only: [:show, :update]

  def index
    @resources = Resource.all
    render json: @resources
  end

  def show
    render json: @resource
  end

  def create
    @resource = Resource.create!(upsert_params)
    render json: @resource
  end

  def update
    @resource.update!(upsert_params)
    render json: @resource
  end

  def destroy
    Resource.destroy_by(params[:id])
    head :no_content
  end

  private

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def upsert_params
    params.permit(:name)
  end
end
